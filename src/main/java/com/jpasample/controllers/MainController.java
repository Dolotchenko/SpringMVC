
package com.jpasample.controllers;

import com.jpasample.dao.HiberDAO;
import com.jpasample.model.*;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class MainController {
    
    Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    HiberDAO dao;

    @Autowired
    MyService myService;
    
    @ModelAttribute("status")
    public String getStatus() {
        return dao.pullStatus();
    }

    @RequestMapping("rest.do")
    public ModelAndView showMain() {
        ModelAndView mv = new ModelAndView("restService");
        return mv;
    }

    @RequestMapping("login.do")
    public ModelAndView showLogin() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }


    @RequestMapping("403")
    public ModelAndView error() {
        ModelAndView mv = new ModelAndView("vMain");
        return mv;
    }


    @RequestMapping("main.do")
    public ModelAndView test() {
        ModelAndView mv = new ModelAndView("vMain");
        return mv;
    }



    @RequestMapping("mainFC.do")
    public ModelAndView showMainFC() {
        ModelAndView mv = new ModelAndView("viewFCMain");
        return mv;
    }


    
    @RequestMapping("regions.do")
    public ModelAndView showRegions() {
        ModelAndView mv = new ModelAndView("viewRegions");
        loadRegions(mv);
        return mv;
    }

    @RequestMapping("addregion.do")
    public ModelAndView addRegion(String reg) {
        ModelAndView mv = new ModelAndView("viewRegions");
        if (reg.length()>0){
            List<Region> addReg = dao.addRegion(reg);
            mv.addObject("regions", addReg);
            log.info(addReg.toString());
            return mv;
        }else{
            loadRegions(mv);
            return mv;
        }

    }

    @RequestMapping("delregion.do")
    public ModelAndView delRegion(long select) {
        ModelAndView mv = new ModelAndView("viewRegions");
        //Region addReg = dao.addRegion(reg);
        List<Region> delReg = dao.delRegion(select);
        mv.addObject("regions", delReg);
        log.info(delReg.toString());
        return mv;
    }


    @RequestMapping("typeofloans.do")
    public ModelAndView showLoanTypes() {
        ModelAndView mv = new ModelAndView("viewTypeOfLoans");
        List<TypeLoan> allTypes = dao.getTypeOfLoans();
        mv.addObject("loans", allTypes);
        log.info(allTypes.toString());
        return mv;
    }

    @RequestMapping("addtypeloan.do")
    public ModelAndView addTypeL(String tl) {
        ModelAndView mv = new ModelAndView("viewTypeOfLoans");
        if (tl.length()>0){
            List<TypeLoan> typeLoans = dao.addTypeLoan(tl);
            mv.addObject("loans", typeLoans);
            log.info(typeLoans.toString());
            return mv;
        }else{
            List<TypeLoan> typeLoans = dao.getTypeOfLoans();
            mv.addObject("loans", typeLoans);
            log.info(typeLoans.toString());
            return mv;
        }

    }


    @RequestMapping("deltypeloan.do")
    public ModelAndView delTypeL(long select) {
        ModelAndView mv = new ModelAndView("viewTypeOfLoans");
        //Region addReg = dao.addRegion(reg);
        List<TypeLoan> delReg = dao.delTypeLoan(select);
        mv.addObject("loans", delReg);
        log.info(delReg.toString());
        return mv;
    }


    @RequestMapping("tariffs.do")
    public ModelAndView showTariffs( ) {
        ModelAndView mv = new ModelAndView("viewTariffs");
        List<Tariff> allTariffs = dao.getTariffs();
        mv.addObject("tariffs", allTariffs);
        log.info(allTariffs.toString());

        List<TypeLoan> allTypes = dao.getTypeOfLoans();
        mv.addObject("loans", allTypes);
        log.info(allTypes.toString());
        return mv;
    }

    @RequestMapping("addtariff.do")
    public ModelAndView AddTariff( String nametariff, int perc, int minsum, int maxsum, long typeloan) {
        ModelAndView mv = new ModelAndView("viewTariffs");
        List<Tariff> tariff=dao.addTariff(nametariff, perc,  minsum,  maxsum, typeloan);
        mv.addObject("tariffs", tariff);

        List<TypeLoan> allTypes = dao.getTypeOfLoans();
        mv.addObject("loans", allTypes);
        log.info(allTypes.toString());
        return mv;
    }

    @RequestMapping("deltariff.do")
    public ModelAndView delTariff(long select) {
        ModelAndView mv = new ModelAndView("viewTariffs");
        List<Tariff> delTar = dao.delTariff(select);
        mv.addObject("tariffs", delTar);
        log.info(delTar.toString());

        List<TypeLoan> allTypes = dao.getTypeOfLoans();
        mv.addObject("loans", allTypes);
        log.info(allTypes.toString());
        return mv;
    }



    @RequestMapping("settariff.do")
    public ModelAndView setTariff(long idtariff, Long numAppl, long amountmoney,
                                  long loanterm, double overpaid, double payment) {
        ModelAndView mv = new ModelAndView("vMain");
        dao.setTariff(idtariff, numAppl, amountmoney, loanterm, overpaid, payment);
        return mv;
    }

    @RequestMapping("typeofsubjects.do")
    public ModelAndView showTypeSubjects() {
        ModelAndView mv = new ModelAndView("viewTypeSubjects");
        List<TypeSubject> allTypesSubj = dao.getTypeSubjects();
        mv.addObject("typeSubj", allTypesSubj);
        log.info(allTypesSubj.toString());
        return mv;
    }

    @RequestMapping("subjects.do")
    public ModelAndView showAllSubjects() {
        ModelAndView mv = new ModelAndView("viewFCSubjects");
        List<Subject> allSubj = dao.getAllSubjects();
        mv.addObject("allSubj", allSubj);
        log.info(allSubj.toString());

        loadRegions(mv);
        return mv;
    }

    private void loadRegions(ModelAndView mv ) {
        List<Region> allRegions =  dao.getAllRegions();
        mv.addObject("regions", allRegions);
        log.info(allRegions.toString());
    }

    @RequestMapping("addsubject.do")
    public ModelAndView addSubject(String fio, String birth, int passeria, int pasnumber, long regid,Long newAppl ) {
        ModelAndView mv = new ModelAndView("viewFCSubjects");
        List<Subject> addSubj = dao.addSubject(fio,birth,passeria,pasnumber,regid);
        mv.addObject("allSubj", addSubj);
        mv.addObject("newAppl",newAppl);
        log.info(addSubj.toString());

        loadRegions(mv);
        return mv;
    }

    @RequestMapping("delsubject.do")
    public ModelAndView delSubjectByID(long id){
        ModelAndView mv = new ModelAndView("viewFCSubjects");
        List<Subject> delSubj = dao.delSubject(id);
        mv.addObject("allSubj",delSubj);
        log.info(delSubj.toString());

        loadRegions(mv);
        return mv;
    }

    @RequestMapping("findsubject.do")
    public ModelAndView findSubject(int ser, int num, Long newAppl ){
        ModelAndView mv = new ModelAndView("viewFCSubjects");
        List<Subject> fSubj = dao.findSubject(ser, num);
        mv.addObject("allSubj",fSubj);
        mv.addObject("newAppl",newAppl);
        log.info(fSubj.toString());
        return mv;
    }


    @RequestMapping("setsubject.do")
    public ModelAndView setSubject(long ids, Long newAppl){
        ModelAndView mv = new ModelAndView("viewFCTariffs");
        Application application = dao.setSubj(ids, newAppl);
        mv.addObject("objAppl",application);
        mv.addObject("numAppl",newAppl);
        log.info(application.toString());

        List<Tariff> allTariffs = dao.getTariffs();
        mv.addObject("tariffs", allTariffs);
        log.info(allTariffs.toString());
        return mv;
    }

    @RequestMapping("applications.do")
    public ModelAndView showAllDebtors() {
        ModelAndView mv = new ModelAndView("viewApplications");
        List<Application> applications = dao.getAllDebtors();
        mv.addObject("allAppl", applications);
        log.info(applications.toString());
        return mv;
    }

    @RequestMapping("filtrapplications.do")
    public ModelAndView showAllDebtors(String filtr) {
        ModelAndView mv = new ModelAndView("viewApplications");
        List<Application> applications = myService.filterApplications(filtr);
        mv.addObject("allAppl", applications);
        log.info(applications.toString());
        return mv;
    }

    @RequestMapping("createapplication.do")
    public ModelAndView createAppl() {
        ModelAndView mv = new ModelAndView("viewFCSubjects");
        Application application = dao.createAppl();
        mv.addObject("newAppl", application.getId());
        log.info(application.toString());

        List<Subject> allsubj = dao.getAllSubjects();
        mv.addObject("allSubj",allsubj);
        log.info(allsubj.toString());

        loadRegions(mv);
        return mv;
    }

    @RequestMapping("continueapplication.do")
    public ModelAndView contAppl() {
        ModelAndView mv = new ModelAndView("viewFCApplicationsForContinue");
        List<Application> applications = dao.getContinueAppl();
        mv.addObject("contAppl", applications);
        log.info(applications.toString());
        return mv;
    }

    @RequestMapping("taketoworkapplication.do")
    public ModelAndView takeToWorkAppl(long appl) {
        ModelAndView mv;
        Application getAppl = dao.getApplInfo(appl);
        String status=getAppl.getStatus();
        log.info(getAppl.toString());
        if (status.equals("ISSUE")){
            mv = new ModelAndView("viewFCIssue");
            mv.addObject("contAppl", getAppl);
            return mv;
        } else if (status.equals("SELECTTARIFF")){
            mv = new ModelAndView("viewFCTariffs");
            mv.addObject("objAppl", getAppl);


            List<Tariff> allTariffs = dao.getTariffs();
            mv.addObject("tariffs", allTariffs);
            log.info(allTariffs.toString());
            return mv;
        } else {
            mv = new ModelAndView("vMain");
            return mv;
        }


    }
//
//    @RequestMapping("closeappl.do")
//    public ModelAndView filtrAppl(String filtr) {
//        ModelAndView mv = new ModelAndView("vMain");
//        dao.setIssueDate(appl, loanDate);
//        return mv;
//    }

    @RequestMapping("closeappl.do")
    public ModelAndView issueAndCloseAppl(long appl, String loanDate) {
        ModelAndView mv = new ModelAndView("vMain");
        dao.setIssueDate(appl, loanDate);
        return mv;
    }

    @RequestMapping("ciapplications.do")
    public ModelAndView showCIApplications() {
        ModelAndView mv = new ModelAndView("viewApplicationsCI");
        List<Application> ciAppl = dao.getCIAppl();
        mv.addObject("allAppl", ciAppl);
        log.info(ciAppl.toString());
        return mv;
    }

    @RequestMapping("completecheck.do")
    public ModelAndView completeCheck(String resultCheckCI, long appl) {
        ModelAndView mv = new ModelAndView("viewApplicationsCI");
        List<Application> ciAppl = dao.setCICheck(resultCheckCI, appl);
        mv.addObject("allAppl", ciAppl);
        log.info(ciAppl.toString());
        return mv;
    }


//    @RequestMapping("selectTariff.do")
//    public ModelAndView addSubjInApplication(long newAppl) {
//        ModelAndView mv = new ModelAndView("viewFCTariffs");
//        Application application = dao.selectTariff(newAppl);
//        mv.addObject("curAppl", application);
//        log.info(application.toString());
//        return mv;
//    }

    @RequestMapping("showCat.do")
    public ModelAndView showOne() {
        ModelAndView mv = new ModelAndView("viewRegions");
        Cat c = dao.getCatById(1);
        mv.addObject("cats", Collections.singletonList(c));
        return mv;
    }
    
    
        
    @RequestMapping("init.do")
    public String init() {
        dao.init();
        return "redirect:main.do";
    }



    @RequestMapping("FC.do")
    public String initFC() {
        return "redirect:mainFC.do";
    }

 /*   @RequestMapping("addcat.do")
    public ModelAndView addCat() {
        dao.addRandomCat();
        return showAll();
    }*/

    

    
    
    
    
}
