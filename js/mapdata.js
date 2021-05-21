var simplemaps_usmap_mapdata={
  main_settings: {
    //General settings
		width: 'responsive', //or 'responsive'
    background_color: "#FFFFFF",
    background_transparent: "yes",
    popups: "off",
    
		//State defaults
		state_description: "",
    state_color: "#000",
    state_hover_color: "#dc3545",
    state_url: "",
    border_size: 1.5,
    border_color: "#ffffff",
    all_states_inactive: "no",
    all_states_zoomable: "no",
    
		//Location defaults
		location_description: "Location description",
    location_color: "#FF0067",
    location_opacity: 0.8,
    location_hover_opacity: 1,
    location_url: "",
    location_size: 25,
    location_type: "square",
    location_border_color: "#FFFFFF",
    location_border: 2,
    location_hover_border: 2.5,
    all_locations_inactive: "no",
    all_locations_hidden: "no",
    
		//Label defaults
		label_color: "#ffffff",
    label_hover_color: "#ffffff",
    label_size: 22,
    label_font: "Arial",
    hide_labels: "no",
   
		//Zoom settings
		manual_zoom: "no",
    back_image: "no",
    arrow_box: "no",
    navigation_size: "40",
    navigation_color: "#f7f7f7",
    navigation_border_color: "#636363",
    initial_back: "no",
    initial_zoom: -1,
    initial_zoom_solo: "no",
    region_opacity: 1,
    region_hover_opacity: 0.6,
    zoom_out_incrementally: "yes",
    zoom_percentage: 0.99,
    zoom_time: 0.5,
    
		//Popup settings
		popup_color: "white",
    popup_opacity: 0.9,
    popup_shadow: 1,
    popup_corners: 5,
    popup_font: "12px/1.5 Verdana, Arial, Helvetica, sans-serif",
    popup_nocss: "no",
    
		//Advanced settings
		div: "map",
    auto_load: "yes",
    rotate: "0",
    url_new_tab: "no",
    images_directory: "default",
    import_labels: "no",
    fade_time: 0.1,
    link_text: "View Website"
  },
  state_specific: {
    HI: {
      name: "Hawaii",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
          url: "results.aspx?t=3&s=HI"

    },
    AK: {
      name: "Alaska",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=AK"
    },
    FL: {
      name: "Florida",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=FL"
    },
    NH: {
      name: "New Hampshire",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=NH"
    },
    VT: {
      name: "Vermont",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=VT"
    },
    ME: {
      name: "Maine",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=ME"
    },
    RI: {
      name: "Rhode Island",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=RI"
    },
    NY: {
      name: "New York",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=NY"
    },
    PA: {
      name: "Pennsylvania",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=PA"
    },
    NJ: {
      name: "New Jersey",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=NJ"
    },
    DE: {
      name: "Delaware",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=DE"
    },
    MD: {
      name: "Maryland",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MD"
    },
    VA: {
      name: "Virginia",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=VA"
    },
    WV: {
      name: "West Virginia",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=WV"
    },
    OH: {
      name: "Ohio",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=OH"
    },
    IN: {
      name: "Indiana",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=IN"
    },
    IL: {
      name: "Illinois",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=IL"
    },
    CT: {
      name: "Connecticut",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=CT"
    },
    WI: {
      name: "Wisconsin",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=WI"
    },
    NC: {
      name: "North Carolina",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=NC"
    },
    DC: {
      name: "District of Columbia",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=DC"
    },
    MA: {
      name: "Massachusetts",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MA"
    },
    TN: {
      name: "Tennessee",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=TN"
    },
    AR: {
      name: "Arkansas",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=AR"
    },
    MO: {
      name: "Missouri",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=MO"
    },
    GA: {
      name: "Georgia",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=GA"
    },
    SC: {
      name: "South Carolina",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=SC"
    },
    KY: {
      name: "Kentucky",
      description: "default",
      color: "#FE5974",
      zoomable: "no",
      hover_color: "default",
        url: "results.aspx?t=3&s=KY"
    },
    AL: {
      name: "Alabama",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=AL"
    },
    LA: {
      name: "Louisiana",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=LA"
    },
    MS: {
      name: "Mississippi",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=MS"
    },
    IA: {
      name: "Iowa",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=IA"
    },
    MN: {
      name: "Minnesota",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MN"
    },
    OK: {
      name: "Oklahoma",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=OK"
    },
    TX: {
      name: "Texas",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=TX"
    },
    NM: {
      name: "New Mexico",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=NM"
    },
    KS: {
      name: "Kansas",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=KS"
    },
    NE: {
      name: "Nebraska",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=NE"
    },
    SD: {
      name: "South Dakota",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=SD"
    },
    ND: {
      name: "North Dakota",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=ND"
    },
    WY: {
      name: "Wyoming",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=WY"
    },
    MT: {
      name: "Montana",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MT"
    },
    CO: {
      name: "Colorado",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=CO"
    },
    UT: {
      name: "Utah",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=UT"
    },
    AZ: {
      name: "Arizona",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=AZ"
    },
    NV: {
      name: "Nevada",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=NV"
    },
    OR: {
      name: "Oregon",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=OR"
    },
    WA: {
      name: "Washington",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=WA"
    },
    CA: {
      name: "California",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=CA"
    },
    MI: {
      name: "Michigan",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MI"
    },
    ID: {
      name: "Idaho",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=ID"
    },
    GU: {
      name: "Guam",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=GU"
    },
    VI: {
      name: "Virgin Islands",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=VI"
    },
    PR: {
      name: "Puerto Rico",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=PR"
    },
    AS: {
      name: "American Samoa",
      description: "default",
      color: "#cccccc",
      inactive:"yes",
      hover_color: "default",
        url: "results.aspx?t=3&s=AS"
    },
    MP: {
      name: "Northern Mariana Islands",
      description: "default",
      color: "#FE5974",
      hover_color: "default",
        url: "results.aspx?t=3&s=MP"
    }
  },
  locations: {
    "0": {
      name: "New York",
      lat: 40.71,
      lng: -74,
      description: "default",
      color: "default",
      url: "default",
      type: "default",
      size: "default"
    },
    "1": {
      name: "Anchorage",
      lat: 61.2180556,
      lng: -149.9002778,
      color: "default",
      type: "circle"
    }
  },
  labels: {
    NH: {
      parent_id: "NH",
      x: "932",
      y: "183",
      pill: "yes",
      width: 45,
      display: "all"
    },
    VT: {
      parent_id: "VT",
      x: "883",
      y: "243",
      pill: "yes",
      width: 45,
      display: "all"
    },
    RI: {
      parent_id: "RI",
      x: "932",
      y: "273",
      pill: "yes",
      width: 45,
      display: "all"
    },
    NJ: {
      parent_id: "NJ",
      x: "883",
      y: "273",
      pill: "yes",
      width: 45,
      display: "all"
    },
    DE: {
      parent_id: "DE",
      x: "883",
      y: "303",
      pill: "yes",
      width: 45,
      display: "all"
    },
    MD: {
      parent_id: "MD",
      x: "932",
      y: "303",
      pill: "yes",
      width: 45,
      display: "all"
    },
    DC: {
      parent_id: "DC",
      x: "884",
      y: "332",
      pill: "yes",
      width: 45,
      display: "all"
    },
    MA: {
      parent_id: "MA",
      x: "932",
      y: "213",
      pill: "yes",
      width: 45,
      display: "all"
    },
    CT: {
      parent_id: "CT",
      x: "932",
      y: "243",
      pill: "yes",
      width: 45,
      display: "all"
    },
    HI: {
      parent_id: "HI",
      x: 305,
      y: 565,
      pill: "yes"
    },
    AK: {
      parent_id: "AK",
      x: "113",
      y: "495"
    },
    FL: {
      parent_id: "FL",
      x: "773",
      y: "510"
    },
    ME: {
      parent_id: "ME",
      x: "893",
      y: "85"
    },
    NY: {
      parent_id: "NY",
      x: "815",
      y: "158"
    },
    PA: {
      parent_id: "PA",
      x: "786",
      y: "210"
    },
    VA: {
      parent_id: "VA",
      x: "790",
      y: "282"
    },
    WV: {
      parent_id: "WV",
      x: "744",
      y: "270"
    },
    OH: {
      parent_id: "OH",
      x: "700",
      y: "240"
    },
    IN: {
      parent_id: "IN",
      x: "650",
      y: "250"
    },
    IL: {
      parent_id: "IL",
      x: "600",
      y: "250"
    },
    WI: {
      parent_id: "WI",
      x: "575",
      y: "155"
    },
    NC: {
      parent_id: "NC",
      x: "784",
      y: "326"
    },
    TN: {
      parent_id: "TN",
      x: "655",
      y: "340"
    },
    AR: {
      parent_id: "AR",
      x: "548",
      y: "368"
    },
    MO: {
      parent_id: "MO",
      x: "548",
      y: "293"
    },
    GA: {
      parent_id: "GA",
      x: "718",
      y: "405"
    },
    SC: {
      parent_id: "SC",
      x: "760",
      y: "371"
    },
    KY: {
      parent_id: "KY",
      x: "680",
      y: "300"
    },
    AL: {
      parent_id: "AL",
      x: "655",
      y: "405"
    },
    LA: {
      parent_id: "LA",
      x: "550",
      y: "435"
    },
    MS: {
      parent_id: "MS",
      x: "600",
      y: "405"
    },
    IA: {
      parent_id: "IA",
      x: "525",
      y: "210"
    },
    MN: {
      parent_id: "MN",
      x: "506",
      y: "124"
    },
    OK: {
      parent_id: "OK",
      x: "460",
      y: "360"
    },
    TX: {
      parent_id: "TX",
      x: "425",
      y: "435"
    },
    NM: {
      parent_id: "NM",
      x: "305",
      y: "365"
    },
    KS: {
      parent_id: "KS",
      x: "445",
      y: "290"
    },
    NE: {
      parent_id: "NE",
      x: "420",
      y: "225"
    },
    SD: {
      parent_id: "SD",
      x: "413",
      y: "160"
    },
    ND: {
      parent_id: "ND",
      x: "416",
      y: "96"
    },
    WY: {
      parent_id: "WY",
      x: "300",
      y: "180"
    },
    MT: {
      parent_id: "MT",
      x: "280",
      y: "95"
    },
    CO: {
      parent_id: "CO",
      x: "320",
      y: "275"
    },
    UT: {
      parent_id: "UT",
      x: "223",
      y: "260"
    },
    AZ: {
      parent_id: "AZ",
      x: "205",
      y: "360"
    },
    NV: {
      parent_id: "NV",
      x: "140",
      y: "235"
    },
    OR: {
      parent_id: "OR",
      x: "100",
      y: "120"
    },
    WA: {
      parent_id: "WA",
      x: "130",
      y: "55"
    },
    ID: {
      parent_id: "ID",
      x: "200",
      y: "150"
    },
    CA: {
      parent_id: "CA",
      x: "79",
      y: "285"
    },
    MI: {
      parent_id: "MI",
      x: "663",
      y: "185"
    },
    PR: {
      parent_id: "PR",
      x: "620",
      y: "545"
    },
    GU: {
      parent_id: "GU",
      x: "550",
      y: "540"
    },
    VI: {
      parent_id: "VI",
      x: "680",
      y: "519"
    },
    MP: {
      parent_id: "MP",
      x: "570",
      y: "575"
    },
    AS: {
      parent_id: "AS",
      x: "665",
      y: "580"
    }
  }
};