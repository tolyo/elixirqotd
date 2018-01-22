import 'whatwg-fetch'
//import $ from "jquery";
// jquery version
// export const fetch = (url, block) => {
//     $.ajax({
//         url: url,
//         success: (result) => $(block).html(result)
//     });
// };

export const getBlock = (url, block) => {
    fetch(url)
    .then(res => res.text())
    .then(body => window.document.getElementById(block).innerHTML = body)
}