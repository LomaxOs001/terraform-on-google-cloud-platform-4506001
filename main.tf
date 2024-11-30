module "qa-blog" {
    source = "./modules/blog"

    app_name    = "qa-blog"
    network_name = "qa-blog-net"
}