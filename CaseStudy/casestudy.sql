create database casestudy;
use casestudy;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * 
from nhan_vien 
where (HO_TEN like 'H%' or HO_TEN like 'T%'or HO_TEN like'K%') and length(ho_ten)<16;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *, year(now()) - year(NGAY_SINH) as 'Tuoi'
from khach_hang 
where (year(now()) - year(NGAY_SINH) between 18 and 50) and (DIA_CHI like '%Đà Nẵng' or DIA_CHI like'%Quảng Trị');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.MA_KH, kh.HO_TEN, count(MA_KHACH_HANG) as 'so lan dat phong', lk.TEN_LK
FROM khach_hang kh
join hop_dong hd
on kh.MA_KH = hd.MA_KHACH_HANG
join loai_khach lk
on lk.MA_LK = kh.MA_LOAI_KHACH
where lk.MA_LK = '1'
group by kh.MA_KH
order by count(MA_KHACH_HANG) asc;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT K.MA_KH, K.HO_TEN, LK.TEN_LK, H.MA_HD, LDV.TEN_LDV, H.NGAY_LAM_HD, H.NGAY_KET_THUC,
(DV.CHI_PHI_THUE + HDCT.SO_LUONG*DVDK.GIA) AS 'Tong_tien'
 FROM khach_hang K LEFT join hop_dong H  ON H.MA_KHACH_HANG = K.MA_KH
	LEFT JOIN loai_khach LK ON K.MA_LOAI_KHACH = LK.MA_LK
    LEFT JOIN dich_vu DV ON H.MA_DICH_VU = DV.MA_LOAI_DV
	LEFT JOIN loai_dich_vu LDV ON LDV.MA_LDV = DV.MA_LOAI_DV
    LEFT JOIN hop_dong_chi_tiet HDCT ON H.MA_HD = HDCT.MA_HOP_DONG
    LEFT JOIN dich_vu_di_kem DVDK ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
    GROUP BY K.HO_TEN;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).


select
    dv.ma_dv,
    dv.ten_dv,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_ldv
    
from
    dich_vu dv
join loai_dich_vu ldv on dv.MA_LOAI_DV = ldv.MA_LDV
where
    not exists (
        select
            *
        from
            hop_dong hd
        where
            hd.ma_dich_vu = dv.ma_dv
            and (year(hd.NGAY_LAM_HD) = '2021')
            and month(hd.NGAY_LAM_HD) between 1
            and 3
    );


-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021

select dv.MA_DV, dv.TEN_DV, dv.DIEN_TICH, dv.SO_NG_TOI_DA, dv.CHI_PHI_THUE, ldv.MA_LDV
from dich_vu dv
join loai_dich_vu ldv
on dv.MA_LOAI_DV = ldv.MA_LDV
where 
exists(
        select*from
            hop_dong hd
        where
            hd.ma_dich_vu = dv.ma_dv
            and (year(hd.NGAY_LAM_HD) = '2020')
)
and
 not exists(
        select*from
            hop_dong hd
        where
            hd.ma_dich_vu = dv.ma_dv
            and (year(hd.NGAY_LAM_HD) = '2021')
);


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten KHÔNG TRÙNG NHAU.
-- Cách 1: (distinct)
select distinct kh.HO_TEN
from khach_hang kh; 
-- Cách 2: (group by)
select kh.ho_ten
from khach_hang kh 
group by kh.HO_TEN; 
-- Cách 3: (union: UNION trong SQL được sử dụng để kết hợp các kết quả của hai hoặc nhiều câu lệnh SELECT 
-- mà không cần trả về bất kỳ hàng trùng lặp nào.)
select kh.ho_ten
from khach_hang kh  
union 
select kh.ho_ten
from khach_hang kh;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng

select dv.MA_DV, dv.TEN_DV, sum(dv.CHI_PHI_THUE)
from dich_vu dv
join hop_dong hd

where exists(
        select*from
            hop_dong hd
        where
            hd.ma_dich_vu = dv.ma_dv
            and (year(hd.NGAY_KET_THUC) = '2021')
)
group by dv.MA_DV, dv.TEN_DV
;



