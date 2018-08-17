//
//  QKBaseCell.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKBaseCell.h"

@implementation QKBaseCell

static NSMutableDictionary* registeredRenderCellMap = NULL;

+ (NSMutableDictionary*)getRegisteredRenderCellMap
{
    return registeredRenderCellMap;
}

+ (void)registerRenderCell:(Class)cellClass messageType:(int)mtype
{
    if (!registeredRenderCellMap) {
        registeredRenderCellMap = [NSMutableDictionary new];
    }
    NSString* className = NSStringFromClass(cellClass);
    [registeredRenderCellMap setObject:className forKey:[NSNumber numberWithInt:mtype]];
}


+ (Class)getRenderClassByMessageType:(int)msgType {
    Class renderClass = NULL;
    NSMutableDictionary* renderMap = [QKBaseCell getRegisteredRenderCellMap];
    NSString* className = [renderMap objectForKey:[NSNumber numberWithInt:msgType]];
    if (!className) {
        className = @"CellUnknown";
    }
    renderClass = NSClassFromString(className);
    return renderClass;
}
- (void)doMessageRendering {
    
}

@end
