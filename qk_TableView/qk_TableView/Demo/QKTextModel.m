//
//  QKTextModel.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKTextModel.h"

@implementation QKTextModel
+ (void)load {
    [super registerRenderCell:[self class] messageType:QKCellTypeText];
}
- (void)getDataDict:(NSDictionary *)dict {
    [super getDataDict:dict];
    self.cellType = QKCellTypeText;
    self.renderHeight = 30;
    self.text = @"中国万岁";
}
@end
