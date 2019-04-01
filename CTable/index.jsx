import React, {Component,PureComponent} from "react";
import {connect} from "react-redux";
import {withRouter} from 'react-router'
import Css from "./index.scss";

import store from "@/store/store.js";
import Desc from './Desc.jsx';
import Esc from './Esc.jsx';
import Noamal from './Noamal.jsx';
function getRowSelection(props) {
    return props.rowSelection || {};
}
class TableComp extends Component {
    constructor(props) {
        super(props);
        this.state={
            clickIndex:-1, //点击的是哪一个
            dec:'desc', //方向
            needselect:false,
            selectdebtlist:[], //选择的数据
            listdata:[],
            all:false, //全选
            // disabledrow:[], //不可用的选择框索引
        }
    }
    disabledrow = []

    componentDidMount() {
        if (this.props.rowSelection) {
            this.setState({
                needselect:true
            })
        }
    }

    componentWillReceiveProps(newp){
        if (this.props.rowSelection!=newp.rowSelection) {
            if (!newp.rowSelection) {
                this.setState({
                    needselect:false
                })
            }else{
                this.setState({
                    needselect:true
                })
            }
        }
        // 如果换页了清一次
        if (this.props.page!=newp.page&&this.props.page || (typeof this.props.reset == 'boolean')&&this.props.reset!=newp.reset) {
            this.disabledrow = [];
            this.setState({
                selectdebtlist:[],all:false
            })
        }
        // 外接主动清零参数
        if (this.props.type!=newp.type&&this.props.type) {
            this.disabledrow = []
            this.setState({
                clickIndex:-1,
                selectdebtlist:[],all:false
            })
        }
    }

    onHandlesort = (rows)=> (m) =>{
    }

    onSort = (e,row) =>()=> {
        if (e == this.state.clickIndex) {
            this.setState({
                dec:this.state.dec=='esc'?'desc':'esc'
            })
            this.props.handsortclick(e,this.state.dec=='esc'?'desc':'esc')
        }else{
            this.setState({
                clickIndex:e,
                dec:'desc'
            })
            this.props.handsortclick(e,'desc')
        }

    }
    onHandleselectdebt = (e)=> { //全选按钮点击

        if (e.target.checked) {
            this.setState({
                all:true,
                selectdebtlist:this.props.data.filter((item,index)=>{
                    return this.disabledrow.indexOf(index) < 0
                })
            },()=> {
                this.props.rowSelection.onChange(this.state.selectdebtlist)
            })
        }else{
            this.setState({
                selectdebtlist:[],
                all:false
            },()=> {
                this.props.rowSelection.onChange(this.state.selectdebtlist)
            })
        }
    }
    onSelectdebt = data => (e)=> {
        const key = this.props.checkkey
        const {selectdebtlist} = this.state

        const {istransfer} = this.props
        if (istransfer) {
            if (e.target.checked) {
                const m = selectdebtlist.concat(data);
                this.setState({
                    selectdebtlist:m,all:false
                },()=> {
                    this.props.rowSelection.onChange(this.state.selectdebtlist)
                })
            }else {
                const m = selectdebtlist.filter((item,ind)=>{
                    //如果是债转的里面就以类别区分
                    return data['bigTenderId'] != item['bigTenderId']
                })
                this.setState({
                    selectdebtlist:m,all:false
                },()=> {
                    this.props.rowSelection.onChange(this.state.selectdebtlist)
                })
            }
            return ;
        }

        if (e.target.checked) {
            const m = selectdebtlist.concat(data);
            this.setState({
                selectdebtlist:m,all:false
            },()=> {
                this.props.rowSelection.onChange(this.state.selectdebtlist)
            })
            // onChildselectdebt(m);
        }else {
            const m = selectdebtlist.filter((item,ind)=>{
                return data[key] != item[key]
            })
            this.setState({
                selectdebtlist:m,all:false
            },()=> {
                this.props.rowSelection.onChange(this.state.selectdebtlist)
            })
            // onChildselectdebt(m);
        }
    }

    checkinclude(rowdata){
        const {istransfer} = this.props
            
        const key = this.props.checkkey
        const {selectdebtlist} = this.state
        for (let i = 0; i < selectdebtlist.length; i++) {
            const element = selectdebtlist[i];
            
            // 如果这个组件使用在我的转让里面的那么可以分类判断勾选，为了不打破此组件的通用性
            //这里数据没沟通，数据在transfer组件里面会通过返回数据得到分类，然后根据分类获得最终数据的
            if (istransfer && rowdata['bigTenderId'] == element['bigTenderId']) {
                return true
            }
            if (rowdata[key] == element[key]) {
                return true
            }
        }
        return false
    }


    getCheckboxPropsByItem = (item, index) => {
        const  rowSelection = getRowSelection(this.props);
        if (!rowSelection.getCheckboxProps) {
          return {};
        }
        const result = rowSelection.getCheckboxProps(item);
        if (result.disabled) {
            // this.setState({
            //     disabledrow:this.state.disabledrow.concat(index)
            // })
            if (!this.disabledrow.includes(index)) {
                this.disabledrow = this.disabledrow.concat(index)
            }
        }
        return result;
    }

    componentWillUpdate(){
        this.disabledrow = []
    }

    render(){
        const {columns=[],data=[],style={},queue=false,jumpqueue=1}=this.props
        const {dec, clickIndex,needselect,all} = this.state
        const ths=columns.map((column,index)=>{
            const {style={},text,sortstyle={},maxWidth}=column
            return (
                <th key={column.key} onClick={column.sort?this.onHandlesort(column):null}>
                <div className={Css.disflex}>
                    <div style={maxWidth?{maxWidth:maxWidth}:{}} dangerouslySetInnerHTML={{ __html:text}}>
                    {/* {text} */}
                    </div>
                    {
                        column.sort?
                        <div onClick={this.onSort(column.sort.condition,column)} style={{cursor:'pointer',width:'40px',height:'30px'}}>
                            {
                                column.sort.condition==clickIndex&&dec=='esc'?
                                <Desc></Desc>
                                :column.sort.condition==clickIndex&&dec=='desc'?
                                <Esc></Esc>:<Noamal></Noamal>
                            }
                        </div>
                        :
                        null
                    }

                </div>
                </th>
            )
        });
        const TabHead=(<thead><tr>
            {
                needselect?
                <th>
                    <label className={'ps_lable'}>
                    <input type="checkbox" id="dedfsbt"
                        ref="debtadfsll"
                        // defaultChecked={false}
                        checked={all}
                        style={{width:'15px',height:'15px'}}
                        onClick={this.onHandleselectdebt}
                    />
                    &nbsp;&nbsp;全选</label>
                </th>:null
            }
            {
                queue?
                <th>
                    序号
                </th>:null
            }
            {ths}
        </tr></thead>)

        const rows=data.map((rowData,index)=>{
            let row=[];

            columns.map((column,i)=>{
                let {render,style={}}=column;

                if(render){//有自定义渲染方法
                    row.push(<td key={i} style={style}>{render(rowData)}</td>);
                }else{
                    row.push(<td key={i} style={style}>
                        {rowData[column.dataIndex]}
                    </td>);
                }
            })
            return <tr key={index}>
            {
                needselect?
                <td key={new Date().getTime()}>
                    <label className={'ps_lable'}>
                    <input type="checkbox" id="debt"
                        ref="debtall"
                        // value={selectdebtlist.indexOf(index)!=-1?true:false}
                        checked={this.checkinclude(rowData)}
                        disabled={this.getCheckboxPropsByItem(rowData, index).disabled}
                        style={{width:'15px',height:'15px'}}
                        onChange={this.onSelectdebt(rowData)}
                    />
                    {/* &nbsp;&nbsp;{index+1} */}
                    </label>
                </td>
                :null
            }
            {
                queue?
                <td>{index+1+jumpqueue}</td>:null
            }
            {row}
            </tr>
        });

        const TabBody=<tbody>
        {rows}
        </tbody>;

        return (
            <div>

            <table className={Css.Ctable} style={style}>
                {TabHead}
                {TabBody}
            </table>
            </div>
        );
    }
}


TableComp = connect((store) => ({store: store}))(TableComp);
export default TableComp;