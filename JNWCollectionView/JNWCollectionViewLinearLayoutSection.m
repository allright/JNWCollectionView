//
//  JNWCollectionViewLinearLayoutSection.m
//  JNWCollectionView
//
//  Created by Andrey Syvrachev on 06.02.14.
//  Copyright (c) 2014 AppJon. All rights reserved.
//

#import "JNWCollectionViewLinearLayoutSection.h"

@implementation JNWCollectionViewLinearLayoutSection

- (instancetype)initWithNumberOfItems:(NSInteger)numberOfItems {
	self = [super init];
	if (self) {
		_numberOfItems = numberOfItems;
		_itemInfo = calloc(numberOfItems, sizeof(JNWCollectionViewLinearLayoutItemInfo));
	}
	return self;
}

- (void)dealloc {
	free(_itemInfo);
}


@end
