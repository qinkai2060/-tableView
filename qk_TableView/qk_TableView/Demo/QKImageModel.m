//
//  QKImageModel.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKImageModel.h"

@implementation QKImageModel
+ (void)load {
    [super registerRenderCell:[self class] messageType:QKCellTypeImage];
}
- (void)getDataDict:(NSDictionary *)dict {
    [super getDataDict:dict];
    self.cellType = QKCellTypeImage;
    self.renderHeight = 100;
    self.imageName = @"3";
}
@end
