using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface ICategoriaRepository
    {
        Task<IEnumerable<Categorias>> ListarCategoriaAsync();

        Task<IEnumerable<Categorias>> ListarCategoriaPorNombreAsync();
        Task NuevoCategoriaAsync(Categorias categorias);
        Task EditarCategoriaAsync(Categorias categorias);

        Task EliminarCategoriaAsync(int Id);




    }
}
