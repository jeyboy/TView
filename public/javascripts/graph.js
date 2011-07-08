var chart;
function create_graph(con,count) {
  chart = new Highcharts.Chart({
    chart: {
      renderTo: con,
      defaultSeriesType: 'spline'
    },
    title: {
      text: 'Total users'
    },
    xAxis: {
      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
      title: {
        text: 'Count'
      }      
    },
    tooltip: {
      crosshairs: true,
      shared: true
    },
    plotOptions: {
      spline: {
        marker: {
          radius: 4,
          lineColor: '#666666',
          lineWidth: 1
        }
      }
    },
    series: [{
      name: 'Users',
      marker: {
        symbol: 'square'
      },
      data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, {
        y: 26.5       
      }, 23.3, 18.3, 13.9, 9.6]
				
    }, {
      name: 'London',
      marker: {
        symbol: 'diamond'
      },
      data: [{
        y: 3.9        
      }, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    }]
  });
								
};

$(function(){
  $('.rule').click(function(){
    $.post ("/admin/statsfull/rules_config", {
      'rule':$(this).attr("name")});
    });
  }
)

