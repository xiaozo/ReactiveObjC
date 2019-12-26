//
//  ViewController.m
//  ReactiveObjC
//
//  Created by jsl on 2019/11/30.
//  Copyright © 2019 zlx. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1、创建订阅者
//    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        //3、发送信号，发送信号之前一定要先订阅信号
//        [subscriber sendNext:@"发送订阅信号"];
//     //数据传递完，最好调用sendCompleted，这时命令才执行完毕。
//    [subscriber sendCompleted];
//
//        return nil;
//    }];
//
//    //2、订阅信号
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"--%@", x);
//    }];
//
//    //再次订阅信号
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"--%@", x);
//    }];
    

    //1.创建信号
//       RACSubject *subject = [RACSubject subject];
//
//       //2.订阅信号
//       [subject subscribeNext:^(id x) {
//           NSLog(@"第一个订阅者%@",x);
//       }];
//
//       [subject subscribeNext:^(id x) {
//       　  NSLog(@"第二个订阅者%@",x);
//       }];
//
//       //3.发送信号
//       [subject sendNext:@"1"];
    
    
    // 1.创建信号
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//
//    // 2.发送信号
//    [replaySubject sendNext:@2];
//    [replaySubject sendNext:@1];
//
//    // 3.订阅信号
//    [replaySubject subscribeNext:^(id x) {
//
//        NSLog(@"第一个订阅者接到的消息%@",x);
//    }];
//
//    // 订阅信号
//    [replaySubject subscribeNext:^(id x) {
//
//        NSLog(@"第二个订阅者接到的消息%@",x);
//    }];
    
    
//    // 1.创建信号
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//
//    // 2.订阅信号
//    [replaySubject subscribeNext:^(id x) {
//
//        NSLog(@"第一个订阅者接到的消息%@",x);
//    }];
//
//    // 订阅信号
//    [replaySubject subscribeNext:^(id x) {
//
//        NSLog(@"第二个订阅者接到的消息%@",x);
//    }];
//
//    // 3.发送信号
//    [replaySubject sendNext:@1];
//    [replaySubject sendNext:@2];
    
    //当UITextField内输入的内容长度大于5时，才会回调subscribeNext
//    [[[self.textField rac_textSignal] filter:^BOOL(NSString * _Nullable value) {
//          return value.length > 5;
//    }] subscribeNext:^(NSString * _Nullable x) {
//          NSLog(@"filter result = %@",  x);
//    }];
    
//    //当UIButton点击时，会调用subscribeNext
//    [[self.btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        NSLog(@"button clicked");
//    }];
//
//    //创建一个信号，2秒后订阅者收到消息
//    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }] delay:2] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"delay : %@", x);
//    }];
//
//    //遍历数组
//    NSArray *array = @[@"1", @"2", @"3", @"4", @"5"];
//    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"数组内容：%@", x);
//    }];
    

    //获取到信号返回的值，包装成新值, 再次通过信号返回给订阅者
//    [[self.textField.rac_textSignal bind:^RACSignalBindBlock _Nonnull{ return ^RACSignal*(id value, BOOL *stop){
//        // 处理完成之后，包装成信号返回出去
//        return [RACSignal return:[NSString stringWithFormat:@"hello: %@",value]];
//        };
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"bind : %@",x); // hello: "x"
//    }];
    
//    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"signalA"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    RACSignal *signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"signalB"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    // 把signalA拼接到signalB后，signalA发送完成，signalB才会被激活 顺序执行
//    [[signalA concat:signalB] subscribeNext:^(id  _Nullable x) {
//        //先拿到 signalA 的结果 ， 再拿到 signalB 的结果 ， 执行两次
//        NSLog(@"concat result = %@", x);
//    }];
    
    // 底层实现  1.使用concat连接then返回的信号  2.先过滤掉之前的信号发出的值
//    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendCompleted];
//        return nil;
//    }] then:^RACSignal *{
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//            //可以对第一个信号的数据进行过滤处理 , 不能直接获得第一个信号的数据返回值
//            [subscriber sendNext:@2];
//            return nil;
//        }];
//    }] subscribeNext:^(id x) {
//        // 只能接收到第二个信号的值，也就是then返回信号的值
//        NSLog(@"then : %@",x); // 2
//    }];
    
    //创建多个信号
//    RACSignal *mergeSignalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }];
//    RACSignal *mergeSignalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    // 合并信号,只要有信号发送数据，都能监听到.
//    RACSignal *mergeSignal = [mergeSignalA merge:mergeSignalB];
//
//    [mergeSignal subscribeNext:^(id x) {
//        //每次获取单个信号的值
//        NSLog(@"merge : %@",x);
//    }];
    
    
//    RACSignal *zipSignalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    RACSignal *zipSignalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        //3秒后执行
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [subscriber sendNext:@3];
//        });
//        //5秒后执行
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [subscriber sendNext:@5];
//        });
//
//        return nil;
//    }];
//
//    RACSignal *zipSignal = [zipSignalA zipWith:zipSignalB];
//
//    [zipSignal subscribeNext:^(id  _Nullable x) {
//        // x 是一个元祖
//        RACTupleUnpack(NSNumber *a, NSNumber *b) = x;
//        NSLog(@"zip with : %@   %@", a, b);
//        //第一次输出   1  3
//        //第二次输出   2  5
//    }];
    
  
//    RACSignal *combineSignalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//
//    RACSignal *combineSignalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [subscriber sendNext:@3];
//        });
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [subscriber sendNext:@5];
//        });
//
//        return nil;
//    }];
//
//    RACSignal *combineSignal = [combineSignalA combineLatestWith:combineSignalB];
//
//    [combineSignal subscribeNext:^(id  _Nullable x) {
//        // x 是一个元祖
//        RACTupleUnpack(NSNumber *a, NSNumber *b) = x;
//        NSLog(@"combineLatest : %@   %@", a, b);
//        //第一次输出 2 3
//        //第二次输出 2 5
//        //因为combineSignalA中的2是最新数据，所以，combineSignalA每次获取到的都是2
//    }];
    
    
    //用于信号发出的内容是元组，把信号发出元组的值聚合成一个值，一般都是先组合在聚合
//    RACSignal *reduceSignalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }];
//
//    RACSignal *reduceSignalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@3];
//        return nil;
//    }];
//
//    RACSignal *reduceSignal = [RACSignal combineLatest:@[reduceSignalA, reduceSignalB] reduce:^id(NSNumber *a, NSNumber *b) {
//        //reduce中主要是对返回数据的处理
//        return [NSString stringWithFormat:@"%@ - %@", a, b];
//    }];
//
//    [reduceSignal subscribeNext:^(id  _Nullable x) {
//        //返回值x 取决于reduce之后的返回
//        NSLog(@"reduce : %@", x);
//    }];
    
    
    
//    map 的底层实现是通过flattenMap 实现的。map 直接对数据进行处理，并且返回处理后的数据
//    [[self.textField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        // 当源信号发出，就会调用这个block，修改源信号的内容
//        // 返回值：就是处理完源信号的内容。
//        return [NSString stringWithFormat:@"hello : %@",value];
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Map : %@",x); // hello: "x"
//    }];
    

    //flattenMap 的底层实现是通过bind实现的。拿到原数据，处理完成之后，包装成信号返回
    [[self.textField.rac_textSignal flattenMap:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
        return  [RACSignal return:[NSString stringWithFormat:@"hello : %@", value]];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"flattenMap : %@", x); // hello "x"
    }];
    
}



@end
