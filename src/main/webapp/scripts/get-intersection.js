function send_intersection_rq(x,y,r) {
    // drawPoint(x, y);

    // send request

    // redraw point by result
    const urlParams =
        new URLSearchParams({"x-select": x, "y-select": y, "r-select": r});
    console.log(ctx)
    window.location = ctx + "/controller?" + urlParams.toString();
}