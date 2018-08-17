//
//  QKBaseCell.h
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QKCellConfiguration.h"
#import  "QKBaseModel.h"
@interface QKBaseCell : UITableViewCell
@property (nonatomic,assign) QKCellType type;

@property (nonatomic,strong) QKBaseModel *model;

+ (NSMutableDictionary*)getRegisteredRenderCellMap;
+ (void)registerRenderCell:(Class)cellClass messageType:(int)mtype;
+ (Class)getRenderClassByMessageType:(int)msgType;

- (void)doMessageRendering;
@end
