package tour.bean;

import java.util.Date;

public class TourDTO {
    private int seq;  // seq 필드 추가
    private String tourId;
    private String tourSubject;
    private String description;
    private String price;
    private String tourImage;
    private Date logtime;
    
    public TourDTO() {}

    public TourDTO(int seq, String tourId, String tourSubject, String description, String price, String tourImage, Date logtime) {
        super();
        this.seq = seq;  // seq 값 초기화
        this.tourId = tourId;
        this.tourSubject = tourSubject;
        this.description = description;
        this.price = price;
        this.tourImage = tourImage;
        this.logtime = logtime;
    }

    // seq에 대한 getter와 setter 추가
    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTourId() {
        return tourId;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public String getTourSubject() {
        return tourSubject;
    }

    public void setTourSubject(String tourSubject) {
        this.tourSubject = tourSubject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTourImage() {
        return tourImage;
    }

    public void setTourImage(String tourImage) {
        this.tourImage = tourImage;
    }

    public Date getLogtime() {
        return logtime;
    }

    public void setLogtime(Date logtime) {
        this.logtime = logtime;
    }
}
