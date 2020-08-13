Data ID: pos-fna-web.yaml
Group: POS_SERVICE_GROUP

server:
  port: ${port:56090} #启动端口 命令行注入
spring:
  application:
    name: pos-fna-web
  main:
    allow-bean-definition-overriding: true # Spring Boot 2.1 需要设定
  cloud:
    nacos:
      discovery:
        server-addr: 127.0.0.1:8848
        namespace: b5c5aed8-cc93-41cb-9f3a-f3c1e2dc312e # 开发环境
        cluster-name: DEFAULT
        group: POS_SERVICE_GROUP
    sentinel:
      transport:
        port: 8721
        dashboard: localhost:8080
        
dubbo:
  scan:
    # dubbo 服务扫描基准包
    base-packages: com.taikang
  protocol:
    # dubbo 协议
    name: dubbo
    # dubbo 协议端口
    #port: ${dubbo_port:20881}
    port: ${dubbo_port:-1}
  registry:
    address: nacos://127.0.0.1:8848
  application:
    qos-enable: false #dubbo运维服务是否开启
  consumer:
    check: false  #启动时就否检查依赖的服务

test: 
  name: pos-fna-web-2020-05-06