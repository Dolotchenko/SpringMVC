package com.jpasample.dao;
import com.jpasample.model.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class HiberDAO {
    
//    @Autowired
//    EntityManagerFactory emf;
    @PersistenceContext
    EntityManager em;
            
    
    
    private Random r = new Random();
    private String lastStatus;
    
    public HiberDAO() {
    }

    @Transactional
    public Cat addRandomCat() {
       // EntityManager em = emf.createEntityManager();
        
        Cat c = new Cat();
        em.getTransaction().begin();
        c.setName("Cat"+r.nextInt(100));
        c.setWeight(1.0f+r.nextInt(40)/10.0f);
        em.persist(c);
        em.getTransaction().commit();
        lastStatus = "Кошка добавлена!";
        return c;
    }

    @Transactional
    public List<Cat> getAllCats() {
      //  EntityManager em = emf.createEntityManager();
        List<Cat> res = em.createQuery("select c from Cat c",Cat.class).getResultList();
        
        return res;
    }
    @Transactional
    public List<Person> getAllPersons() {
      //  EntityManager em = emf.createEntityManager();
        List<Person> res = em.createQuery("select p from Person p",Person.class).getResultList();
        
        return res;
    }

    @Transactional
    public List<Application> getAllApplications() {
        //  EntityManager em = emf.createEntityManager();
        List<Application> res = em.createQuery("select p from Application p",Application.class).getResultList();

        return res;
    }

    @Transactional
    public Application  delApplById(long id) {
        Application c= getApplicationById(id);
        if (c!=null)
            em.remove(c);
        return c;
    }

    @Transactional
    public void init() {
     //   EntityManager em = emf.createEntityManager();
        
        //em.createQuery("delete from Cat c where c.id>0").executeUpdate();
        
        Cat c;
        Region r;
        TypeLoan tl;
        Tariff trf;
        Subject s;
   //     em.getTransaction().begin();
        em.createQuery("delete from Cat c where c.id>0").executeUpdate();
        
        c = new Cat("Barsik", 5.0f, null);
        em.persist(c);
        c = new Cat("Muska", 2.0f, null);
        em.persist(c);
        c = new Cat("Pushok", 0.5f, null);
        em.persist(c);
        
//       Person p = new Person("Ivan");
//       em.persist(p);
        
       // em.getTransaction().commit();
        lastStatus = "Кошки построены!";


       // em.getTransaction().begin();
        r=new Region("Bashkortostan");
        em.persist(r);
        r=new Region("Adygeya");
        em.persist(r);
        r=new Region("Krym");
        em.persist(r);

        tl= new TypeLoan("MRTG");
        em.persist(tl);
        tl= new TypeLoan("CRDS");
        em.persist(tl);
        tl=new TypeLoan("AUTO");
        em.persist(tl);
        tl=new TypeLoan("CASH");
        em.persist(tl);

        tl = new TypeLoan("MRTG_NEW");
        trf=new Tariff("MY_FIRST_TARIFF",10000L,300000L,10L,tl);
        em.persist(trf);

        tl = new TypeLoan("MRTG_NEW");
        trf=new Tariff("MY_SECOND_TARIFF",12000L,300000L,12L,tl);
        em.persist(trf);

        tl = new TypeLoan("CRDS_NEW");
        trf=new Tariff("CRDS_TARIFF",1000L,250000L,14L,tl);
        em.persist(trf);

        r=new Region("Krasnodar region");
        s=new Subject("Иванов Иван Иванович","23-11-1990",8012,590366,r);
        em.persist(s);


     //   em.getTransaction().commit();
    }

    public void main() {}

    @Transactional
    /// проблема с многопоточным доступом! 
    public String pullStatus() {
        return lastStatus;
    }
    @Transactional
    public Cat getCatById(int i) {
        return new Cat("??", 0f, null);
    }

    @Transactional
    public List<Region> getAllRegions(){
     //   EntityManager em = emf.createEntityManager();
        List<Region> res = em.createQuery("select r from Region r",Region.class).getResultList();
        return res;
    }

    @Transactional
    public List<Region> addRegion(String region){
        //   EntityManager em = emf.createEntityManager();
        Region reg=new Region();
        reg.setRegionName(region);
        List<Region> res = em.createQuery("select r from Region r",Region.class).getResultList();
        res.add(reg);
        em.persist(reg);
        return res;
    }

    @Transactional
    public List<Region> delRegion(long id){
        Region p=em.find(Region.class,id );
        em.remove(p);
        List<Region> res = em.createQuery("select r from Region r",Region.class).getResultList();
        return res;
    }

    @Transactional
    public List<TypeLoan> getTypeOfLoans(){
        //  EntityManager em = emf.createEntityManager();
        List<TypeLoan> t = em.createQuery("select r from TypeLoan r",TypeLoan.class).getResultList();
        return t;
    }

    @Transactional
    public List<TypeLoan> addTypeLoan(String typeloan){
        TypeLoan tl=new TypeLoan();
        tl.setLoanName(typeloan);
        List<TypeLoan> res = em.createQuery("select r from TypeLoan r",TypeLoan.class).getResultList();
        res.add(tl);
        em.persist(tl);
        return res;
    }

    @Transactional
    public List<TypeLoan> delTypeLoan(long id){
        TypeLoan tl=em.find(TypeLoan.class,id );
        em.remove(tl);
        List<TypeLoan> res = em.createQuery("select r from TypeLoan r",TypeLoan.class).getResultList();
        return res;
    }

    @Transactional
    public List<TypeSubject> getTypeSubjects(){
     //   EntityManager em = emf.createEntityManager();
        List<TypeSubject> tsubj = em.createQuery("select r from TypeSubject r",TypeSubject.class).getResultList();
        return tsubj;
    }

    @Transactional
    public List<Tariff> getTariffs(){
        //   EntityManager em = emf.createEntityManager();
        List<Tariff> tariffs = em.createQuery("select r from Tariff r",Tariff.class).getResultList();
        return tariffs;
    }

    @Transactional
    public List<Tariff> addTariff(String nametariff, int perc, int minsum, int maxsum, long typeloan){

        TypeLoan typeLoan= em.find(TypeLoan.class,typeloan );
        Tariff t=new Tariff();
        //tl.setLoanName(typeloan);
        t.setNameTariff(nametariff);
        t.setInterestRate(perc);
        t.setMinSum(minsum);
        t.setMaxSum(maxsum);
        t.setTypeLoan(typeLoan);

        List<Tariff> tariffs = em.createQuery("select r from Tariff r",Tariff.class).getResultList();
        tariffs.add(t);
        em.persist(t);
        return tariffs;
    }

    @Transactional
    public List<Tariff> delTariff(long id){
        Tariff tariff=em.find(Tariff.class,id );
        em.remove(tariff);
        List<Tariff> res = em.createQuery("select r from Tariff r",Tariff.class).getResultList();
        return res;
    }





    @Transactional
    public List<Subject> getAllSubjects(){
        //   EntityManager em = emf.createEntityManager();
        List<Subject> subjects = em.createQuery("select r from Subject r",Subject.class).getResultList();
        return subjects;
    }

    @Transactional
    public List<Subject> addSubject(String fio, String birth, int passeria, int pasnumber, long regid){
        Subject subj=new Subject();
        subj.setFIO(fio);
        subj.setBirthDay(birth);
        subj.setPasportSeria(passeria);
        subj.setPasportNumber(pasnumber);
        Region r=em.find(Region.class,regid);
        subj.setRegion(r);

        List<Subject> res = em.createQuery("select r from Subject r",Subject.class).getResultList();
        res.add(subj);
        em.persist(subj);
        return res;
    }

    @Transactional
    public List<Subject> delSubject(long id){
        Subject subject=em.find(Subject.class,id );
        em.remove(subject);
        List<Subject> res = em.createQuery("select r from Subject r",Subject.class).getResultList();
        return res;
    }

    @Transactional
    public List<Subject> findSubject(int seria, int number){

        List<Subject> res = em.createQuery("select r from Subject r where r.pasportSeria = ?1 and r.pasportNumber = ?2"
                ,Subject.class).setParameter(1,seria).setParameter(2,number ).getResultList();

        return res;
    }

    @Transactional
    public Application setSubj(long subjId, Long newAppl ){
        Subject subject=em.find(Subject.class,subjId );
        Application application= getApplicationById(newAppl.longValue());
        application.setSubject(subject);
        application.setStatus("SELECTTARIFF");
        Application res = em.createQuery("select r from Application r where r.id=?1",Application.class).setParameter(1,newAppl ).getSingleResult();
        em.persist(application);
        return res;
    }

    @Transactional
    public void setTariff(long tariffId, long numAppl, long amount,long loanterm, double overpaid, double payment){
        //   EntityManager em = emf.createEntityManager();
        Tariff tar= em.find(Tariff.class,tariffId );
        Application application= getApplicationById(numAppl);
        application.setTariff(tar);
        application.setAmountMoney(amount);
        application.setLoanTerm(loanterm);
        application.setOverpaidAmount(overpaid);
        application.setMonthlyPayment(payment);
        application.setStatus("CheckCI");
        em.persist(application);

    }

    @Transactional
    public List<Application> getAllDebtors(){
        //   EntityManager em = emf.createEntityManager();
        List<Application> debtors = em.createQuery("select r from Application r", Application.class).getResultList();
        return debtors;
    }

    @Transactional
    public Application createAppl(){
        Application application=new Application();
        application.setStatus("START");
        em.persist(application);
        return application;
    }

    @Transactional
    public List<Application> getContinueAppl(){
        List<Application> application = em.createQuery("select r from Application r " +
                        "where r.status not like 'END' and r.status not like 'CANCEL' and r.status not like 'CheckCI' and r.status not like 'START'",Application.class).getResultList();
        return application;
    }

    @Transactional
    public List<Application> getCIAppl(){
        List<Application> application = em.createQuery("select r from Application r " +
                "where r.status  like  'CheckCI'",Application.class).getResultList();
        return application;
    }

    @Transactional
    public List<Application> setCICheck(String resultCheckCI, long appl){
        Application application= getApplicationById(appl);
        application.setCheckCI(resultCheckCI);
        if (resultCheckCI.equals("reject")){
            application.setStatus("END");
        }else if(resultCheckCI.equals("approve")){
            application.setStatus("ISSUE");
        } else {
            application.setStatus("SELECTTARIFF");
        }
        //em.persist(application);

        List<Application> a =getCIAppl(); /*em.createQuery("select r from Application r " +
                "where r.status  like  'CheckCI'",Application.class).getResultList();*/
        return a;
    }

    private Application getApplicationById(long appl) {
        return em.find(Application.class, appl);
    }

    @Transactional
    public Application getApplInfo(long idAppl){
        Application res = em.createQuery("select r from Application r where r.id=?1",Application.class).setParameter(1,idAppl ).getSingleResult();

        return res;
    }

    @Transactional
    public List<Application> getApplFilter(String paramFiltr){
        List<Application> res = em.createQuery("select r from Application r where r.status=?1",Application.class).setParameter(1,paramFiltr ).getResultList();

        return res;
    }

    @Transactional
    public void setIssueDate(long idAppl, String loanDate){
        Application application= getApplicationById(idAppl);
        application.setStatus("END");
        application.setLoanDate(loanDate);
        em.persist(application);

    }


//    @Transactional
//    public Application selectTariff( long id){
//        Application a=em.find(Application.class,id );
//    }




}