remote-service.yaml
POS_GROUP

server:
  port: ${port:56030} #启动端口 命令行注入

spring:
  application:
    name: remote-service  
  #main:
    #allow-bean-definition-overriding: true # Spring Boot 2.1 需要设定
  #datasource:
      #url: jdbc:mysql://localhost:3306/tkhk?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC
      #username: root
      #password: 123456
      #driver-class-name: com.mysql.cj.jdbc.Driver
  cloud:
    nacos:
      discovery:
        server-addr: 127.0.0.1:8848
        namespace: a786f4d0-3332-452b-95bf-fea6addb093c
        cluster-name: DEFAULT
        group: POS_GROUP

dubbo:
  scan:
    # dubbo 服务扫描基准包
    base-packages: com.taikang
  protocol:
    # dubbo 协议
    name: dubbo
    # dubbo 协议端口
    port: -1
  registry:
    address: nacos://127.0.0.1:8848
  application:
    qos-enable: false #dubbo运维服务是否开启
  consumer:
    check: false  #启动时就否检查依赖的服务

test: 
  name: REMOTE-SERVICE-2020-05-08