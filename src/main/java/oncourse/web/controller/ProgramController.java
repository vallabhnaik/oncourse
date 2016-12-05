package oncourse.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import oncourse.model.dao.ProgramDao;

@Controller
public class ProgramController {

    @Autowired
    private ProgramDao programDao;

    @RequestMapping("/program/list")
    public String list( ModelMap models )
    {
        models.put( "programs", programDao.getPrograms() );
        return "program/list";
    }

    @RequestMapping("/program/view")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "program", programDao.getProgram( id ) );
        return "program/view";
    }

}
