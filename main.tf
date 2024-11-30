module "qa-blog" {
    source = "./module/blog"

    app_name    = "qa-blog"
    network_name = "qa-blog_net"
}