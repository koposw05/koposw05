<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="org.zerock.mapper.BoardMapper">

	<insert id="create">
		insert into tbl_board (title, content, writer)
		values(#{title},#{content}, #{writer})
	</insert>

	<select id="read" resultType="org.zerock.domain.BoardVO">
		select
		bno, title, content, writer, regdate, viewcnt , replycnt
		from
		tbl_board
		where bno = #{bno}
	</select>

	<update id="update">
		update tbl_board set title =#{title}, content =#{content}
		where bno = #{bno}
	</update>

	<update id="updateViewCnt">
		update tbl_board set viewcnt = viewcnt + 1 where bno = #{bno}
	</update>
	<delete id="delete">
		delete from tbl_board where bno = #{bno}
	</delete>

	<select id="listAll" resultType="org.zerock.domain.BoardVO">
 <![CDATA[
 select 
   bno, title, content, writer, regdate, viewcnt , replycnt
 from 
   tbl_board 
 where bno > 0 
 order by bno desc, regdate desc
 ]]>
	</select>

	<select id="listPage" resultType="BoardVO">
 <![CDATA[
 select 
   bno, title, content, writer, regdate, viewcnt , replycnt
 from 
   tbl_board 
 where bno > 0 
 order by bno desc, regdate desc
 limit #{page}, 10
 ]]>
	</select>

	<select id="listCriteria" resultType="BoardVO">
 <![CDATA[
 select 
   bno, title, content, writer, regdate, viewcnt , replycnt
 from 
   tbl_board 
 where bno > 0 
 order by bno desc, regdate desc
 limit #{pageStart}, #{perPageNum}
 ]]>
	</select>



	<select id="countPaging" resultType="int">
 <![CDATA[
 select 
   count(bno) 
 from 
   tbl_board 
 where 
   bno > 0 
 ]]>
	</select>



	<sql id="search">
		<if test="searchType != null">
			<if test="searchType == 't'.toString()">
				and title like CONCAT('%', #{keyword}, '%')
			</if>
			<if test="searchType == 'c'.toString()">
				and content like CONCAT('%', #{keyword}, '%')
			</if>
			<if test="searchType == 'w'.toString()">
				and writer like CONCAT('%', #{keyword}, '%')
			</if>
			<if test="searchType == 'tc'.toString()">
				and ( title like CONCAT('%', #{keyword}, '%') OR content like
				CONCAT('%', #{keyword}, '%'))
			</if>
			<if test="searchType == 'cw'.toString()">
				and ( content like CONCAT('%', #{keyword}, '%') OR writer like
				CONCAT('%', #{keyword}, '%'))
			</if>
			<if test="searchType == 'tcw'.toString()">
				and ( title like CONCAT('%', #{keyword}, '%')
				OR
				content like CONCAT('%', #{keyword}, '%')
				OR
				writer like CONCAT('%', #{keyword}, '%'))
			</if>
		</if>
	</sql>

	<select id="listSearch" resultType="BoardVO">
<![CDATA[  
  select * 
  from tbl_board 
  where bno > 0 
]]>

		<include refid="search"></include>
  
<![CDATA[    
  order by bno desc
  limit #{pageStart}, #{perPageNum}
]]>
	</select>

	<select id="listSearchCount" resultType="int">
<![CDATA[  
  select count(bno) 
  from tbl_board 
  where bno > 0 
]]>
		<include refid="search"></include>

	</select>

</mapper>
