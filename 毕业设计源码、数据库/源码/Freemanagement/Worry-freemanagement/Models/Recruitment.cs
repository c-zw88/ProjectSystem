//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Worry_freemanagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Recruitment
    {
        public int RecruitmentID { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Age { get; set; }
        public string Sex { get; set; }
        public string Nativeplace { get; set; }
        public string Education { get; set; }
        public string Position { get; set; }
        public string Photos { get; set; }
        public int DepartmentID { get; set; }
        public string Introduction { get; set; }
    
        public virtual Departmental Departmental { get; set; }
    }
}
