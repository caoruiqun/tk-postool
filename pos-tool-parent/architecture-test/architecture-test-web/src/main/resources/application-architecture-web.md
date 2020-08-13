Data ID: architecture-test-web.yaml
Group: POS_ARCHITECTURE_TEST_GROUP

server:
  port: 56020 #启动端口 命令行注入 
  servlet:
    context-path: /architecture-test-web
spring:
  application:
    name: architecture-test-web
  main:
    allow-bean-definition-overriding: true # Spring Boot 2.1 需要设定
  cloud:
    nacos:
      discovery:
        server-addr: 127.0.0.1:8848
        namespace: b5c5aed8-cc93-41cb-9f3a-f3c1e2dc312e # 开发环境
        cluster-name: DEFAULT
        group: POS_ARCHITECTURE_TEST_GROUP # 架构搭建测试业务组
    sentinel:
      transport:
        port: 8721
        dashboard: localhost:8080
        
dubbo:
  protocol:
    # dubbo 协议
    name: dubbo
    # dubbo 协议端口
    #port: ${dubbo_port:20881}
    port: ${dubbo_port:-1}
  registry:
    address: nacos://127.0.0.1:8848
    #address: spring-cloud://localhost
  application:
    qos-enable: false #dubbo运维服务是否开启
  consumer:
    check: false  #启动时就否检查依赖的服务

test: 
  name: architecture-test-web-2020-05-06