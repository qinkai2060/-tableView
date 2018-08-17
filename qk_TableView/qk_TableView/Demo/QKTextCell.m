//
//  QKTextCell.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKTextCell.h"

@implementation QKTextCell

+ (void)load {
    [super registerRenderCell:[self class] messageType:QKCellTypeText];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.textLb];
    }
    return self;
}
- (UILabel *)textLb {
    if (!_textLb) {
        _textLb = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _textLb.text = @"中国万岁";
        _textLb.textColor = [UIColor redColor];
        _textLb.font = [UIFont systemFontOfSize:18];
        _textLb.textAlignment = NSTextAlignmentCenter;
    }
    return _textLb;
}
@end
