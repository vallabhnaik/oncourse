package oncourse.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import oncourse.model.Course;
import oncourse.model.dao.CourseDao;

@Controller
@SessionAttributes("course")
public class CourseController {

    @Autowired
    private CourseDao courseDao;

    @RequestMapping("/course/list")
    public String list( ModelMap models )
    {
        models.put( "courses", courseDao.getCourses() );
        return "course/list";
    }

    @RequestMapping(value = "/course/add", method = RequestMethod.GET)
    public String add( ModelMap models )
    {
        models.put( "course", new Course() );
        return "course/add";
    }

    @RequestMapping(value = "/course/add", method = RequestMethod.POST)
    public String add( @ModelAttribute Course course )
    {
        course = courseDao.saveCourse( course );
        return "redirect:list";
    }

    @RequestMapping(value = "/course/edit", method = RequestMethod.GET)
    public String edit( @RequestParam Long id, ModelMap models )
    {
        models.put( "course", courseDao.getCourse( id ) );
        return "course/edit";
    }

    @RequestMapping(value = "/course/edit", method = RequestMethod.POST)
    public String edit( @ModelAttribute Course course )
    {
        course = courseDao.saveCourse( course );
        return "redirect:list";
    }

}
