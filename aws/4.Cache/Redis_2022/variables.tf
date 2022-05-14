############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
variable "elscache_prefixname" {
    type = string
    default = "cachemodule"
    description = "ElasticCache prefix name. This will use to setup prefix name of cache (Must begin with a lower case letter and contain only alphanumeric characters)."
}

variable "elscache_engine" {
    type = string
    default = "redis"
    description = "Define Cache engine for create cache"
    validation {
    condition     = contains(["redis", "memcached"], var.elscache_engine)
    error_message = "Cache engine is incorrect. Allow value is should be (redis, memcached)."
    }
}

variable "elscache_replicas" {
    type = number
    default = 1
    description = "Total number of replicas of member in cache (1 - 3). *Remark: Redis suppot only 1"
    validation {
    condition     = var.elscache_replicas >= 1 && var.elscache_replicas <= 3 && floor(var.elscache_replicas) == var.elscache_replicas
    error_message = "Replicas number is accept in range : 1-3."
  }
}

variable "elscache_instance_type" {
    type = string
    default = "cache.t3.micro"
    description = "Define Cache sizing for create cache (memcache: https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/nodes-select-size.html/) (redis: https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html)"
    validation {
    condition     = contains(["cache.t3.micro", "cache.t3.small", "cache.t3.medium", "cache.r6g.large", "cache.r6g.xlarge", "cache.r6g.2xlarge", "cache.r5.large","cache.r5.xlarge","cache.r5.2xlarge"], var.elscache_instance_type)
    error_message = "Cache type variable is incorrect. Allow value is should be (cache.t3.micro, cache.t3.small, cache.t3.medium, cache.r6g.large, cache.r6g.xlarge, cache.r6g.2xlarge, cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge)."
    }
}


variable "elscache_version" {
    type = map
    description = "Elasticache engine version. By default system will choose lastest version for each engine type for you. This can customize by check detail on AWS ElastiCache"
    default = {
    "redis"        = "6.2"
    "memcached"    = "1.6.6"
  }
}

variable "elscache_parameter" {
    type = map
    description = "Elasticache parameter group. By default system will choose lastest version parameter group for you. This can customize by check detail on AWS ElastiCache"
    default = {
    "redis"        = "default.redis6.x"
    "memcached"    = "default.memcached1.6"
  }
}

variable "elscache_window" {
    type = string
    default = "sun:03:00-sun:05:00"
    description = "Cache maintenance period time. This will manage by AWS for upgrade version of fix some patch. We should setup period that database can schedule for downtime"
    validation {
    condition     = contains(["sat:02:00-sat:04:00", "sat:03:00-sat:05:00", "sun:02:00-sun:04:00", "sun:03:00-sun:05:00"], var.elscache_window)
    error_message = "Cache maintenance periods is incorrect. Allow value is should be (sat:02:00-sat:04:00, sat:03:00-sat:05:00, sun:02:00-sun:04:00, sun:03:00-sun:05:00)."
    }
}
############################################################################################################
# Local Tag Description Variable                                                                           #
############################################################################################################
variable "tag_category" {
  type = string
  default = "cache"
  description = "Category of element to create on AWS for cache element wil define value as 'cache'"
}