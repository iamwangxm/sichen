<table width="100%"  border="1" bordercolor="#B8D5AD" cellpadding="0"  cellspacing="0" >
  <tr>
    <td colspan="4" align="center">可辅导时间</td>
  </tr>
  <tr>
    <td><div align="center">周一</div></td>
    <td><div align="center">周二</div></td>
    <td><div align="center">周三</div></td>
    <td><div align="center">周四</div></td>
  </tr>
  <tr>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周一上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周一上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周一下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周一下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周一晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周一晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周二上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周二上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周二下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周二下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周二晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周二晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周三上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周三上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周三下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周三下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周三晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周三晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周四上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周四上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周四下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周四下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周四晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周四晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td><div align="center">周五</div></td>
    <td><div align="center">周六</div></td>
    <td><div align="center">周日</div></td>
    <td>　</td>
  </tr>
  <tr>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周五上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周五上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周五下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周五下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周五晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周五晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周六上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周六上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周六下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周六下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周六晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周六晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tbody>
        <tr>
          <td>上午</td>
          <td>下午</td>
          <td>晚上</td>
        </tr>
        <tr>
          <td><input value="周日上午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周日上午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周日下午" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周日下午")>0 then response.write "checked" end if %> /></td>
          <td><input value="周日晚上" disabled type="checkbox" name="times" <%if instr(rs("sksj"),"周日晚上")>0 then response.write "checked" end if %> /></td>
        </tr>
      </tbody>
    </table></td>
    <td><input id="times" value="时间面谈" disabled type="checkbox" name="times"  <%if instr(rs("sksj"),"时间面谈")>0 then response.write "checked" end if %>/>
      时间面谈</td>
  </tr>
  <tr>
    <td colspan="4">辅导次数</td>

  </tr>
  <tr>
    <td colspan="4">
    <select id="times" size="1" name="times" disabled>
      <option value="1次/周" <%if instr(rs("sksj"),"1次/周")>0 then response.write "selected='selected'" end if %>>1</option>
      <option value="2次/周" <%if instr(rs("sksj"),"2次/周")>0 then response.write "selected='selected'" end if %>>2</option>
      <option value="3次/周" <%if instr(rs("sksj"),"3次/周")>0 then response.write "selected='selected'" end if %>>3</option>
      <option value="4次/周" <%if instr(rs("sksj"),"4次/周")>0 then response.write "selected='selected'" end if %>>4</option>
      <option value="5次/周" <%if instr(rs("sksj"),"5次/周")>0 then response.write "selected='selected'" end if %>>5</option>
      <option value="6次/周" <%if instr(rs("sksj"),"6次/周")>0 then response.write "selected='selected'" end if %>>6</option>
      <option value="7次/周" <%if instr(rs("sksj"),"7次/周")>0 then response.write "selected='selected'" end if %>>7</option>
      <option value="8次/周" <%if instr(rs("sksj"),"8次/周")>0 then response.write "selected='selected'" end if %>>8</option>
      <option value="9次/周" <%if instr(rs("sksj"),"9次/周")>0 then response.write "selected='selected'" end if %>>9</option>
      <option value="10次/周" <%if instr(rs("sksj"),"10次/周")>0 then response.write "selected='selected'" end if %>>10</option>
      <option value="11次/周" <%if instr(rs("sksj"),"11次/周")>0 then response.write "selected='selected'" end if %>>11</option>
      <option value="12次/周" <%if instr(rs("sksj"),"12次/周")>0 then response.write "selected='selected'" end if %>>12</option>
      <option value="13次/周" <%if instr(rs("sksj"),"13次/周")>0 then response.write "selected='selected'" end if %>>13</option>
      <option value="14次/周" <%if instr(rs("sksj"),"14次/周")>0 then response.write "selected='selected'" end if %>>14</option>
    </select>
      次/周　
      <select id="times" size="1" name="times" disabled>
        <option value="1小时/次"  <%if instr(rs("sksj"),"1小时/次")>0 then response.write "selected='selected'" end if %>>1</option>
        <option value="1.5小时/次"  <%if instr(rs("sksj"),"1.5小时/次")>0 then response.write "selected='selected'" end if %>>1.5</option>
        <option value="2小时/次"  <%if instr(rs("sksj"),"2小时/次")>0 then response.write "selected='selected'" end if %>>2</option>
        <option value="2.5小时/次"  <%if instr(rs("sksj"),"2.5小时/次")>0 then response.write "selected='selected'" end if %>>2.5</option>
        <option value="3小时/次"  <%if instr(rs("sksj"),"3小时/次")>0 then response.write "selected='selected'" end if %>>3</option>
        <option value="3.5小时/次"  <%if instr(rs("sksj"),"3.5小时/次")>0 then response.write "selected='selected'" end if %>>3.5</option>
        <option value="4小时/次"  <%if instr(rs("sksj"),"4小时/次")>0 then response.write "selected='selected'" end if %>>4</option>
        <option value="4.5小时/次"  <%if instr(rs("sksj"),"4.5小时/次")>0 then response.write "selected='selected'" end if %>>4.5</option>
        <option value="5小时/次"  <%if instr(rs("sksj"),"5小时/次")>0 then response.write "selected='selected'" end if %>>5</option>
        <option value="5.5小时/次"  <%if instr(rs("sksj"),"5.5小时/次")>0 then response.write "selected='selected'" end if %>>5.5</option>
        <option value="6小时/次"  <%if instr(rs("sksj"),"6小时/次")>0 then response.write "selected='selected'" end if %>>6</option>
      </select>
      小时/次</td>
  </tr>
</table>