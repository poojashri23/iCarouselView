//
//  ViewController.m
//  CellView
//
//  Created by Admin on 20/02/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>
    @property (nonatomic, assign) BOOL wrap;
    @property (nonatomic, strong) NSMutableArray *items;
  

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    carouselView = _carousel;
   carouselView.delegate = self;
   carouselView.dataSource = self;
    carouselView.type = iCarouselOptionRadius;
    carouselView.centerItemWhenSelected = true;
    //    iCarouselOptionShowBackfaces,
//    iCarouselOptionOffsetMultiplier,
//    iCarouselOptionVisibleItems,
//    iCarouselOptionCount,
//    iCarouselOptionArc,
//    iCarouselOptionAngle,
//    iCarouselOptionRadius,
//    iCarouselOptionTilt,
//    iCarouselOptionSpacing,
//    iCarouselOptionFadeMin,
//    iCarouselOptionFadeMax,
//    iCarouselOptionFadeRange,
//    iCarouselOptionFadeMinAlpha;

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setUp
{
    //set up data
    self.wrap = YES; 
    self.items = [NSMutableArray array];
    for (int i = 0; i < 7; i++)
    {
        [self.items addObject:@(i)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return (NSInteger)[self.items count];
}


- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150.0, 150.0)];
    UILabel *label = nil;
    //create new view if no view is available for recycling
    if (index == carouselView.currentItemIndex ){
          view.backgroundColor = [UIColor colorWithRed:05/255.0f green:39/255.0f blue:42/255.0f alpha:0.5];
    }
    else{
        view.backgroundColor = [UIColor colorWithRed:205/255.0f green:39/255.0f blue:42/255.0f alpha:0.3];
        
    }
        view.layer.cornerRadius = view.frame.size.width/2;
        view.contentMode = UIViewContentModeCenter;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:30];
        label.textColor = [UIColor whiteColor];
        label.tag = 1;
        [view addSubview:label];
  
    label = (UILabel *)[view viewWithTag:1];

    label.text = [self.items[(NSUInteger)index] stringValue];
    
    return view;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150.0, 150.0)];
    UILabel *label = nil;
    //create new view if no view is available for recycling
    if (index == carouselView.currentItemIndex ){
        view.backgroundColor = [UIColor colorWithRed:05/255.0f green:39/255.0f blue:42/255.0f alpha:0.7];
    }
    else{
        view.backgroundColor = [UIColor colorWithRed:205/255.0f green:39/255.0f blue:42/255.0f alpha:0.3];
    }
    view.layer.cornerRadius = view.frame.size.width/2;
    view.contentMode = UIViewContentModeCenter;
    label = [[UILabel alloc] initWithFrame:view.bounds];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [label.font fontWithSize:30];
    label.textColor = [UIColor whiteColor];
    label.tag = 1;
    [view addSubview:label];
    
    label = (UILabel *)[view viewWithTag:1];
    
    label.text = [self.items[(NSUInteger)index] stringValue];
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, 1 / .0, 0.0, 1.0, 0.0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset );
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return self.wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return 0.8;
        }
        case iCarouselOptionFadeMax:
        {
            if (carouselView.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 5.0;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps
// uncomment to make action on tap.
//- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
//{
//    NSNumber *item = (self.items)[(NSUInteger)index];
//    NSLog(@"Tapped view number: %@", item);
//}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
    [carouselView reloadData];

    NSLog(@"Index: %@", @(carouselView.currentItemIndex));

    
}



@end
