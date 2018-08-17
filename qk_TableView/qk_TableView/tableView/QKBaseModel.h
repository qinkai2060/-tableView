//
//  QKBaseModel.h
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QKCellConfiguration.h"
@interface QKBaseModel : NSObject
@property (nonatomic, assign)  QKCellType   cellType;
@property (nonatomic, assign)  float        renderHeight;

+ (void)registerRenderCell:(Class)cellClass messageType:(int)mtype;
+ (Class)getRenderClassByMessageType:(int)mtype;
+ (BOOL)isHasClassnameByType:(int)mtype;
- (void)getDataDict:(NSDictionary*)dict;
@end
