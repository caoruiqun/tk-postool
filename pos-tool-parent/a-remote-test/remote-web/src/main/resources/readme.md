remote-web.yaml	
POS_GROUP


server:
  port: 56020 #启动端口 命令行注入
spring:
  application:
    name: remote-web
  main:
    allow-bean-definition-overriding: true # Spring Boot 2.1 需要设定
  cloud:
    nacos:
      discovery:
        server-addr: 127.0.0.1:8848
        namespace: a786f4d0-3332-452b-95bf-fea6addb093c # 开发环境
        cluster-name: DEFAULT
        group: POS_GROUP
    sentinel:
      transport:
        port: 8721
        dashboard: localhost:8080

dubbo:
  protocol:
    name: dubbo
    port: -1
  registry:
    address: nacos://127.0.0.1:8848
  cloud:
    subscribed-services: remote-service