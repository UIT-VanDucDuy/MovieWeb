package com.example.webmovie.service.Membertype;

import com.example.webmovie.entity.MemberType;
import com.example.webmovie.repo.MemberType.IMemberTypeRepo;
import com.example.webmovie.repo.MemberType.MemberTypeRepo;

import java.util.List;

public class MemberTypeService implements IMemberTypeService {
    IMemberTypeRepo memberTypeRepo = new MemberTypeRepo();

    @Override
    public List<MemberType> getMemberType() {
        return memberTypeRepo.getMemberType();
    }
}
