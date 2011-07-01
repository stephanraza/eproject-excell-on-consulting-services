using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities.Enums
{
    /// <summary>
    /// Determines the type of a contact person.
    /// </summary>
    public enum TableType
    {
        /// <summary>
        /// Indicates an unidentified value.
        /// </summary>
        Account = 0,
        /// <summary>
        /// Indicates a friend.
        /// </summary>
        Category = 1,
        /// <summary>
        /// Indicates a family member.
        /// </summary>
        Family = 2,
        /// <summary>
        /// Indicates a co worker.
        /// </summary>
        Colleague = 3
    }
}
