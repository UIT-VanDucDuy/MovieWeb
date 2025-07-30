package Entity;

import java.util.Date;

public class Movie {
    private int id;
    private String Name;
    private String MainActor;
    private String Author;
    private String Description;
    private Date ReleaseDate;
    private int Membertype;
    private boolean IsSeries;

    public Movie(int id, String name, String mainActor, String author, String description, Date releaseDate, int membertype, boolean isSeries) {
        this.id = id;
        Name = name;
        MainActor = mainActor;
        Author = author;
        Description = description;
        ReleaseDate = releaseDate;
        Membertype = membertype;
        IsSeries = isSeries;
    }


}
