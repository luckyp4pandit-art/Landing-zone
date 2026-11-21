variable "QA_rg" {
  type = map(object({
    rg_name = string
    rg_location = string 
  }))
}