//
//  TableViewCell.m
//  UITableViewDemo
//
//  Created by Gin on 16/11/28.
//  Copyright © 2016年 Gin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
//    xxxView.backgroundColor = [UIColor xxxxColor];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
//    xxxView.backgroundColor = [UIColor xxxxColor];
}

@end
