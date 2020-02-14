<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <section class="section bg-light"  id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-7 mx-auto text-center mb-5">
            <h2 class="heading">Check Availabilty</h2>
          </div>
        </div>
        <div class="row">
          <div class="block-32">

            <form action="#">
              <div class="row">
              	<div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 111111111111111111111111111111111111111111111111111111111111 -->
                  <label for="checkin_date" class="font-weight-bold text-black">지역 찾기</label>
                  
                  <div class="field-icon-wrap">
                    <div class="icon">
<!--                     <span class="icon-calendar"></span> -->
						<!-- 여기 -->
                    </div>
<!--                     <input type="text" id="checkin_date" class="form-control"> -->
						
                  </div>
                </div>
                <!-- 체크인 -->
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 2222222222222222222222222222222222222222222222222222222222222222 -->
                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                  <!-- 달력 -->
                  <div class="field-icon-wrap">
                    <div class="icon">
                    <span class="icon-calendar"></span>
                    </div>
                    
                    <input type="text" id="checkin_date" class="form-control">
                  </div>
                  <!-- 달력 끝 -->
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3"><!-- 3333333333333333333333333333333333333333333333333333333333333333333 -->
                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout_date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3"><!-- 4444444444444444444444444444444444444444444444444444444444444444444 -->
                  <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="adults" class="font-weight-bold text-black">Adults</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="adults" class="form-control">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4+</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="children" class="font-weight-bold text-black">Children</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="children" class="form-control">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4+</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 align-self-end"> <!-- 55555555555555555555555555555555555555555555555555555555555555555 -->
                  <button class="btn btn-primary py-3 px-5">Check Availabilty</button>
                </div>
              </div>
            </form>
            
          </div>
        </div>
      </div>
    </section>