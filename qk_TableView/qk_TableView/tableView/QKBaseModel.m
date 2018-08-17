//
//  QKBaseModel.m
//  qk_TableView
//
//  Created by 秦恺 on 2018/8/17.
//  Copyright © 2018年 秦恺. All rights reserved.
//

#import "QKBaseModel.h"

@implementation QKBaseModel
static NSMutableDictionary* registeredDRChatMessageMap = NULL;


+ (NSMutableDictionary*)getRegisteredRenderCellMap
{
    return registeredDRChatMessageMap;
}

+ (void)registerRenderCell:(Class)cellClass messageType:(int)mtype
{
    if (!registeredDRChatMessageMap) {
        registeredDRChatMessageMap = [NSMutableDictionary new];
    }
    NSString* className = NSStringFromClass(cellClass);
    [registeredDRChatMessageMap setObject:className forKey:[NSNumber numberWithInt:mtype]];
}


+ (Class)getRenderClassByMessageType:(int)mtype
{
    Class renderClass = NULL;
    NSMutableDictionary* renderMap = [QKBaseModel getRegisteredRenderCellMap];
    NSString* className = [renderMap objectForKey:[NSNumber numberWithInt:mtype]];
    if (!className) {
        className = @"CCMessageCellUnknown";
    }
    renderClass = NSClassFromString(className);
    return renderClass;
}

+ (BOOL)isHasClassnameByType:(int)mtype
{
    NSMutableDictionary* renderMap = [QKBaseModel getRegisteredRenderCellMap];
    NSString* className = [renderMap objectForKey:[NSNumber numberWithInt:mtype]];
    if (className) {
        return YES;
    }
    return NO;
}
- (void)getDataDict:(NSDictionary*)dict {
    
}
@end
