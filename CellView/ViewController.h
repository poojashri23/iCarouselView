//
//  ViewController.h
//  CellView
//
//  Created by Admin on 20/02/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ViewController : UIViewController{
    iCarousel *carouselView;
}

//@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet UIView *carousel;

@end

