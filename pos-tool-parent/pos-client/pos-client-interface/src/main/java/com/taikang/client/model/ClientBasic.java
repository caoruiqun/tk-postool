package com.taikang.client.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "t_client_basic")
public class ClientBasic implements Serializable {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 代理人工号
     */
    @Column(name = "agent_no")
    private String agentNo;

    /**
     * 客户号
     */
    @Column(name = "client_no")
    private String clientNo;

    /**
     * 欢迎语
     */
    private Byte appellation;

    /**
     * 姓（中文）
     */
    @Column(name = "surname_ch")
    private String surnameCh;

    /**
     * 名（中文）
     */
    @Column(name = "given_name_ch")
    private String givenNameCh;

    /**
     * 姓（英文）
     */
    @Column(name = "surname_en")
    private String surnameEn;

    /**
     * 名（英文）
     */
    @Column(name = "given_name_en")
    private String givenNameEn;

    /**
     * 机构名称
     */
    private String organization;

    /**
     * 性别
            0：男性
            1：女性
     */
    private Byte gender;

    /**
     * 出生日期
     */
    @Column(name = "Birthday")
    private Date birthday;

    /**
     * 机构登记日期（机构客户）
     */
    @Column(name = "registration_date")
    private Date registrationDate;

    /**
     * 国籍
            0-243
     */
    private Byte nationality;

    /**
     * 证件类别
     */
    @Column(name = "id_type")
    private Byte idType;

    /**
     * 其他证件
     */
    @Column(name = "id_type_more")
    private String idTypeMore;

    /**
     * 证件号码/商业登记号码
     */
    @Column(name = "id_code")
    private String idCode;

    /**
     * 证件到期日
     */
    @Column(name = "id_expiry_date")
    private Date idExpiryDate;

    /**
     * 证件发出国家
     */
    @Column(name = "certificate_issue_country")
    private Byte certificateIssueCountry;

    /**
     * 证件状况
     */
    @Column(name = "certificate_status")
    private Byte certificateStatus;

    /**
     * 电话区号
     */
    @Column(name = "telephone_code")
    private Byte telephoneCode;

    /**
     * 电话号码
     */
    private String mobile;

    /**
     * 创建人（代理人工号）
     */
    @Column(name = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 修改人
     */
    @Column(name = "edit_by")
    private String editBy;

    /**
     * 修改时间
     */
    @Column(name = "edit_time")
    private Date editTime;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取代理人工号
     *
     * @return agent_no - 代理人工号
     */
    public String getAgentNo() {
        return agentNo;
    }

    /**
     * 设置代理人工号
     *
     * @param agentNo 代理人工号
     */
    public void setAgentNo(String agentNo) {
        this.agentNo = agentNo == null ? null : agentNo.trim();
    }

    /**
     * 获取客户号
     *
     * @return client_no - 客户号
     */
    public String getClientNo() {
        return clientNo;
    }

    /**
     * 设置客户号
     *
     * @param clientNo 客户号
     */
    public void setClientNo(String clientNo) {
        this.clientNo = clientNo == null ? null : clientNo.trim();
    }

    /**
     * 获取欢迎语
     *
     * @return appellation - 欢迎语
     */
    public Byte getAppellation() {
        return appellation;
    }

    /**
     * 设置欢迎语
     *
     * @param appellation 欢迎语
     */
    public void setAppellation(Byte appellation) {
        this.appellation = appellation;
    }

    /**
     * 获取姓（中文）
     *
     * @return surname_ch - 姓（中文）
     */
    public String getSurnameCh() {
        return surnameCh;
    }

    /**
     * 设置姓（中文）
     *
     * @param surnameCh 姓（中文）
     */
    public void setSurnameCh(String surnameCh) {
        this.surnameCh = surnameCh == null ? null : surnameCh.trim();
    }

    /**
     * 获取名（中文）
     *
     * @return given_name_ch - 名（中文）
     */
    public String getGivenNameCh() {
        return givenNameCh;
    }

    /**
     * 设置名（中文）
     *
     * @param givenNameCh 名（中文）
     */
    public void setGivenNameCh(String givenNameCh) {
        this.givenNameCh = givenNameCh == null ? null : givenNameCh.trim();
    }

    /**
     * 获取姓（英文）
     *
     * @return surname_en - 姓（英文）
     */
    public String getSurnameEn() {
        return surnameEn;
    }

    /**
     * 设置姓（英文）
     *
     * @param surnameEn 姓（英文）
     */
    public void setSurnameEn(String surnameEn) {
        this.surnameEn = surnameEn == null ? null : surnameEn.trim();
    }

    /**
     * 获取名（英文）
     *
     * @return given_name_en - 名（英文）
     */
    public String getGivenNameEn() {
        return givenNameEn;
    }

    /**
     * 设置名（英文）
     *
     * @param givenNameEn 名（英文）
     */
    public void setGivenNameEn(String givenNameEn) {
        this.givenNameEn = givenNameEn == null ? null : givenNameEn.trim();
    }

    /**
     * 获取机构名称
     *
     * @return organization - 机构名称
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置机构名称
     *
     * @param organization 机构名称
     */
    public void setOrganization(String organization) {
        this.organization = organization == null ? null : organization.trim();
    }

    /**
     * 获取性别
            0：男性
            1：女性
     *
     * @return gender - 性别
            0：男性
            1：女性
     */
    public Byte getGender() {
        return gender;
    }

    /**
     * 设置性别
            0：男性
            1：女性
     *
     * @param gender 性别
            0：男性
            1：女性
     */
    public void setGender(Byte gender) {
        this.gender = gender;
    }

    /**
     * 获取出生日期
     *
     * @return Birthday - 出生日期
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置出生日期
     *
     * @param birthday 出生日期
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取机构登记日期（机构客户）
     *
     * @return registration_date - 机构登记日期（机构客户）
     */
    public Date getRegistrationDate() {
        return registrationDate;
    }

    /**
     * 设置机构登记日期（机构客户）
     *
     * @param registrationDate 机构登记日期（机构客户）
     */
    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    /**
     * 获取国籍
            0-243
     *
     * @return nationality - 国籍
            0-243
     */
    public Byte getNationality() {
        return nationality;
    }

    /**
     * 设置国籍
            0-243
     *
     * @param nationality 国籍
            0-243
     */
    public void setNationality(Byte nationality) {
        this.nationality = nationality;
    }

    /**
     * 获取证件类别
     *
     * @return id_type - 证件类别
     */
    public Byte getIdType() {
        return idType;
    }

    /**
     * 设置证件类别
     *
     * @param idType 证件类别
     */
    public void setIdType(Byte idType) {
        this.idType = idType;
    }

    /**
     * 获取其他证件
     *
     * @return id_type_more - 其他证件
     */
    public String getIdTypeMore() {
        return idTypeMore;
    }

    /**
     * 设置其他证件
     *
     * @param idTypeMore 其他证件
     */
    public void setIdTypeMore(String idTypeMore) {
        this.idTypeMore = idTypeMore == null ? null : idTypeMore.trim();
    }

    /**
     * 获取证件号码/商业登记号码
     *
     * @return id_code - 证件号码/商业登记号码
     */
    public String getIdCode() {
        return idCode;
    }

    /**
     * 设置证件号码/商业登记号码
     *
     * @param idCode 证件号码/商业登记号码
     */
    public void setIdCode(String idCode) {
        this.idCode = idCode == null ? null : idCode.trim();
    }

    /**
     * 获取证件到期日
     *
     * @return id_expiry_date - 证件到期日
     */
    public Date getIdExpiryDate() {
        return idExpiryDate;
    }

    /**
     * 设置证件到期日
     *
     * @param idExpiryDate 证件到期日
     */
    public void setIdExpiryDate(Date idExpiryDate) {
        this.idExpiryDate = idExpiryDate;
    }

    /**
     * 获取证件发出国家
     *
     * @return certificate_issue_country - 证件发出国家
     */
    public Byte getCertificateIssueCountry() {
        return certificateIssueCountry;
    }

    /**
     * 设置证件发出国家
     *
     * @param certificateIssueCountry 证件发出国家
     */
    public void setCertificateIssueCountry(Byte certificateIssueCountry) {
        this.certificateIssueCountry = certificateIssueCountry;
    }

    /**
     * 获取证件状况
     *
     * @return certificate_status - 证件状况
     */
    public Byte getCertificateStatus() {
        return certificateStatus;
    }

    /**
     * 设置证件状况
     *
     * @param certificateStatus 证件状况
     */
    public void setCertificateStatus(Byte certificateStatus) {
        this.certificateStatus = certificateStatus;
    }

    /**
     * 获取电话区号
     *
     * @return telephone_code - 电话区号
     */
    public Byte getTelephoneCode() {
        return telephoneCode;
    }

    /**
     * 设置电话区号
     *
     * @param telephoneCode 电话区号
     */
    public void setTelephoneCode(Byte telephoneCode) {
        this.telephoneCode = telephoneCode;
    }

    /**
     * 获取电话号码
     *
     * @return mobile - 电话号码
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 设置电话号码
     *
     * @param mobile 电话号码
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * 获取创建人（代理人工号）
     *
     * @return create_by - 创建人（代理人工号）
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建人（代理人工号）
     *
     * @param createBy 创建人（代理人工号）
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取修改人
     *
     * @return edit_by - 修改人
     */
    public String getEditBy() {
        return editBy;
    }

    /**
     * 设置修改人
     *
     * @param editBy 修改人
     */
    public void setEditBy(String editBy) {
        this.editBy = editBy == null ? null : editBy.trim();
    }

    /**
     * 获取修改时间
     *
     * @return edit_time - 修改时间
     */
    public Date getEditTime() {
        return editTime;
    }

    /**
     * 设置修改时间
     *
     * @param editTime 修改时间
     */
    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }
}