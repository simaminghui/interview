package controller;


import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.News;
import service.NewsService;

import java.util.List;

@Controller
public class NewsController {


    @Autowired
    private NewsService newsService;

    @RequestMapping("/news")
    public String newsShow(Model model)
    {
        List<News> news = newsService.allNews();

        model.addAttribute("news",news);

        return "news";
    }


    @RequestMapping("/news/tip")
    @ResponseBody
    public News newsTip(Integer id)
    {
       return newsService.getNewsById(id);
    }

    @RequestMapping("/news/someNews")
    @ResponseBody
    public List<News> allnews()
    {
        List<News> news = newsService.allNews();
        return news;
    }


}
