//
//  Runtime.m
//  UITableViewDemo
//
//  Created by Gin on 16/11/10.
//  Copyright © 2016年 Gin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UILabel (RuntimeTest)

@property (nonatomic, copy) UIColor *originalBackgroundColor;

@end

@implementation UILabel (RuntimeTest)

- (UIColor *)originalBackgroundColor {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setOriginalBackgroundColor:(UIColor *)originalBackgroundColor {
    
    objc_setAssociatedObject(self, @selector(originalBackgroundColor), originalBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end



@implementation UITableViewCell (RuntimeTest)

+ (void)load {
    
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            
            SEL originalSelector = @selector(setHighlighted:animated:);
            SEL swizzledSelector = @selector(ex_setHighlighted:animated:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            
            SEL originalSelector = @selector(setSelected:animated:);
            SEL swizzledSelector = @selector(ex_setSelected:animated:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    }
}

- (void)ex_setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    // 交换后的 setHighlighted:(BOOL)highlighted animated:(BOOL)animated 方法
    // 记录原先的背景颜色
    UILabel *label;
    if (highlighted == YES) {
        for (UIView *subview in self.contentView.subviews) {
            if ([subview isKindOfClass:[UILabel class]]) {
                label = (UILabel *)subview;
                label.originalBackgroundColor = label.backgroundColor;
            }
        }
    }
    // 调用 setHighlighted:(BOOL)highlighted animated:(BOOL)animated 方法之后，设置背景颜色
    [self ex_setHighlighted:highlighted animated:animated];
    if (label.originalBackgroundColor) {
        label.backgroundColor = label.originalBackgroundColor;
    }
    /**
     同理以下代码：
     [super setHighlighted:highlighted animated:animated];
     xxxView.backgroundColor = [UIColor xxxColor];
     */
}

- (void)ex_setSelected:(BOOL)selected animated:(BOOL)animated {
    
    // 调用 setSelected:(BOOL)selected animated:(BOOL)animated 方法之后，设置背景颜色
    [self ex_setSelected:selected animated:animated];
    for (UIView *subview in self.contentView.subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subview;
            if (label.originalBackgroundColor) {
                label.backgroundColor = label.originalBackgroundColor;
            }
        }
    }
    /**
     同理以下代码：
     [super setSelected:selected animated:animated];
     xxxView.backgroundColor = [UIColor xxxColor];
     */
}

@end
