//
//  QKImageCell.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKImageCell.h"

@implementation QKImageCell
+ (void)load {
    [super  registerRenderCell:[self class] messageType:QKCellTypeImage];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconView];
    }
    return self;
}
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _iconView.image = [UIImage imageNamed:@"3"];
    }
    return _iconView;
}

@end
