using System;
using System.Collections.Generic;
using System.Text;

namespace Soru5
{
    public class SearchModel
    {
        public List<FilmInfo> Search { get; set; }

        public int TotalResults { get; set; }

        public bool Response { get; set; }
    }
}
