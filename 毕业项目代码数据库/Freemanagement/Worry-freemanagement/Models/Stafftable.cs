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
    
    public partial class Stafftable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Stafftable()
        {
            this.punishments = new HashSet<punishments>();
            this.Wage = new HashSet<Wage>();
            this.Clockin = new HashSet<Clockin>();
        }
    
        public int EmployeeID { get; set; }
        public string Name { get; set; }
        public string Sex { get; set; }
        public string Telephone { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public System.DateTime EntryTime { get; set; }
        public string Photos { get; set; }
        public string Position { get; set; }
        public string Education { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Nativeplace { get; set; }
        public int Age { get; set; }
    
        public virtual Departmental Departmental { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<punishments> punishments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Wage> Wage { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Clockin> Clockin { get; set; }
    }
}
