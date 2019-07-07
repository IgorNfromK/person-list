import React from 'react';
import ReactDOM from 'react-dom';

import './index.css';


const Person = ({img, name, job}) =>{
    const url=`https://randomuser.me/api/portraits/thumb/men/${img}.jpg`;

    return (
        <article className="person">
            <img src={url} />
            <h4>{name}</h4>
            <h5>{job}</h5>
        </article>
    );
}
const PersonList = () =>{
    return(
        <section className="person-list">
            <Person img="12" name="John Doe" job="plumber"/>
            <Person img="23" name="Jim Beam" job="carpenter"/>
            <Person img="34" name="Josh makovski" job="electrician" />

            
        </section>
    )
}
ReactDOM.render(<PersonList/>, document.getElementById('root'))