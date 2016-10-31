//
//  Test.m
//  ETMX
//
//  Created by 杨香港 on 2016/10/30.
//  Copyright © 2016年 杨香港. All rights reserved.
//

#import "Test.h"
#import "NetWorkManager.h"
@implementation Test
-(void)soapRequestTest{
    NSArray *paramters = @[@"admin",@"admin"];
    NSString *urlStr = @"http://192.168.1.161:8085/ETMX/services/Login";
    NSString *methodName = @"checkUserInfo";
    [NetWorkManager sendRequestWith:paramters url:urlStr method:methodName success:^(id data) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:data error:&error];
        NSDictionary *dict1 = [dict valueForKey:@"soap:Envelope"];
        NSDictionary *dict2 = [dict1 valueForKey:@"soap:Body"];
        NSDictionary *dict3 = [dict2 valueForKey:@"ns1:checkUserInfoResponse"];
        NSDictionary *dict4 = [dict3 valueForKey:@"ns1:out"];
        NSString *str = [dict4 valueForKey:@"text"];//该字段根据实践情况获得
        NSData *newData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *p = [[NSXMLParser alloc] initWithData:newData];
        [p setDelegate:self];
        [p parse];
    } failure:^(NSError *error) {
        //错误输出
        NSLog(@"%@",error);
    }];
}
//以下代理是具体情况实现
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"--------BEGINPARSER---------");
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"节点－－－%@",elementName);
    NSLog(@"节点属性－－－－%@",attributeDict);
    NSLog(@"%@",[attributeDict valueForKey:@"flag"]);
}
-(void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment{
    NSLog(@"节点内容－－－－%@",comment);
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"节点－－－ %@",elementName);
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"---------ENDPARSER--------------");
}
@end
