//
//  STSingleton.m
//  shoppingTest
//
//  Created by umut on 27/02/15.
//  Copyright (c) 2015 SmartClick. All rights reserved.
//

#import "STSingleton.h"

@implementation STSingleton


+(id)sharedInstance
{
    static STSingleton *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance  = [[STSingleton alloc]init];
    });
    return _sharedInstance;

}

-(id)init
{
    if (self = [super init]) {
        _urlDict = [NSDictionary new];
    }
    return self;

}

-(void)setUrlDict:(NSDictionary *)dict
{
    _urlDict = dict;
}

-(NSString *)getElementFromUrlDictWithKey:(NSString *)key
{
    return [_urlDict objectForKey:key];
}

-(void)setIsAppOpened:(BOOL)status
{
    _isAppOpened = status;
}

-(void)setIsPushTriggered:(BOOL)status;
{
    _isPushTriggered = status;
}

-(BOOL)getIsAppOpened{
    return _isAppOpened;
}
-(BOOL)getIsPushTriggered
{
    return _isPushTriggered;
}
@end
