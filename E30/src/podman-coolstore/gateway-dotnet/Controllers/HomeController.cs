using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Net.Http;
using Newtonsoft.Json;

namespace gateway.Controllers
{
    public class HomeController : Controller
    {

        private readonly ILogger<ProductsController> _logger;

        public HomeController(ILogger<ProductsController> logger)
        {
            _logger = logger;

        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

    }
}
