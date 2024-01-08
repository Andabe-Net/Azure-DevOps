using DevOpsDemo.Models;
using DevOpsDemo.Repository;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DevOpsDemo.Controllers
{
    public class HomeController : Controller
    {
        IPostRepository PostRepository;
        
        public HomeController(IPostRepository _PostRepository)
        {
            PostRepository = _PostRepository;
        }
        public IActionResult Index()
        {
            var model=PostRepository.GetPosts();
            return View(model);
        }
        public IActionResult About()
        {
            ViewData["Message"] = "A simple DevOPs Demo to learn DevOps By Andabe";
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Contact me @ Andabeamulah@gmail.com";
            return View();
        }
        public IActionResult Privacy()
        {
            
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
           
            return View(new ErrorViewModel
            { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
