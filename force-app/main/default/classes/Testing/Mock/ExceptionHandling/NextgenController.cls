public class NextgenController {
    public NextgenService service;
    public NextgenController(NextgenService service){
        this.service = service;
    }

    public NextgenWrapper getNextgenDetailsById(String nextgenId){
        return this.service.getNextgenDetailsById(nextgenId);
    }

    public void saveNextgenRecord(NextgenWrapper nextgenWrapper){
        this.service.saveNextgenRecord(nextgenWrapper);
    }
}