//
//  ViewController.m
//  itsSomething
//
//  Created by Jorge Nonell on 4/30/18.
//  Copyright © 2018 Jorge Nonell. All rights reserved.
//
#import <QuartzCore/CAMetalLayer.h>
#include <MoltenVK/mvk_vulkan.h>

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation View

/** Returns a Metal-compatible layer. */
+(Class) layerClass { return [CAMetalLayer class]; }

@end
