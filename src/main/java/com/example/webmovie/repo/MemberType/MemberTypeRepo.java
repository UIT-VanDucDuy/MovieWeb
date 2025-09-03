package com.example.webmovie.repo.MemberType;

import com.example.webmovie.entity.MemberType;
import com.example.webmovie.entity.Movie;
import com.example.webmovie.repo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberTypeRepo implements IMemberTypeRepo{
    private final String GET_MEMBER_TYPE = "Select * From membertype";

    @Override
    public List<MemberType> getMemberType() {
        List<MemberType> memberTypeList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_MEMBER_TYPE)) {

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("Id");
                String name = rs.getString("MemberTypeName");

                MemberType memberType = new MemberType(id, name);
                memberTypeList.add(memberType);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi query");
        }
        return memberTypeList;
    }
}
