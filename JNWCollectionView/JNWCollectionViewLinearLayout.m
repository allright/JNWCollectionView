//
//  JNWCollectionViewLinearLayout.m
//  JNWCollectionView
//
//  Created by Andrey Syvrachev on 05.02.14.
//  Copyright (c) 2014 AppJon. All rights reserved.
//

#import "JNWCollectionViewLinearLayout+Protected.h"

NSString * const JNWCollectionViewLinearLayoutHeaderKind = @"JNWCollectionViewLinearLayoutHeader";
NSString * const JNWCollectionViewLinearLayoutFooterKind = @"JNWCollectionViewLinearLayoutFooter";

@implementation JNWCollectionViewLinearLayout

- (NSMutableArray *)sections {
	if (_sections == nil) {
		_sections = [NSMutableArray array];
	}
	return _sections;
}

@end
